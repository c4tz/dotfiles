from openrazer.client import DeviceManager

COLOR = [9, 255, 46]

device_manager = DeviceManager()
devices = device_manager.devices
device_manager.sync_effects = False

for device in device_manager.devices:
    device.fx.static(*COLOR)
    if device.name == "Razer Naga Chroma":
        device.fx.misc.scroll_wheel.static(*COLOR)
        # Logo LED is broken, try to set best looking color
        device.fx.misc.logo.static(0, 255, 3)
