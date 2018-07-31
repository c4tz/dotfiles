import dbus, os, sys, textwrap, urllib.parse

players = ['rhythmbox', 'vlc']
sb = dbus.SessionBus()

string = ''
for player in sorted(players):
	try:
		obj = sb.get_object("org.mpris.MediaPlayer2."+player, "/org/mpris/MediaPlayer2")
		props_int = dbus.Interface(obj, "org.freedesktop.DBus.Properties")
		meta_dict = props_int.Get("org.mpris.MediaPlayer2.Player", "Metadata")
		playbackStatus = props_int.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus")
		#print(meta_dict)

		errorCount = 0
		try:
			title = meta_dict["xesam:title"]
		except KeyError:
			title = '[No Title]'
			errorCount += 1
		string += title
		try:
			artists = ", ".join(meta_dict["xesam:artist"])
			string += ' - ' + artists
		except KeyError:
			errorCount += 1
		if errorCount >= 2:
			try:
				filename = os.path.basename(meta_dict["xesam:url"])
				filename, extension = os.path.splitext(filename)
				string = urllib.parse.unquote(filename)
			except:
				string = '[Stopped]'
	except dbus.exceptions.DBusException:
		pass
if string:
	print(string)
else:
	sys.exit(1)
