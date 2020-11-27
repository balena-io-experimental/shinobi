# balena-shinobi <img src="https://raw.githubusercontent.com/balena-io-playground/shinobi/main/logo.png" alt="Shinobi CCTV" height="24"/>

Shinobi CCTV stack for NVIDIA Jetson Nano with balenaCloud

## Requirements

- NVIDIA Jetson Nano development board
- Optional external USB drive for video storage

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![deploy button](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/balena-io-playground/shinobi&defaultDeviceType=jetson-nano)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`MYSQL_ROOT_PASSWORD`|`********`|(required) password that will be set for the MariaDB root account|
|`ADMIN_EMAIL`|`admin@shinobi.video`|(optional) email that will be set for the Shinobi superuser account|
|`ADMIN_PASSWORD`|`admin`|(optional) password that will be hashed and set for the Shinobi superuser account|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|

## Usage

<https://shinobi.video/docs/>

Log in as superuser to create your first user account. The default credentials are in your device logs.

<http://mydevice.local/super>

Then log in to the dashboard and start adding monitors (cameras).

<http://mydevice.local>

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Acknowledgments

- <https://shinobi.video>
- <https://mariadb.com/>
