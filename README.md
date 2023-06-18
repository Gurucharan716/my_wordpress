WordPress Management Script 

![Screenshot_20230618_163207](https://github.com/Gurucharan716/my_wordpress/assets/120701020/29b168af-9f07-4d02-8979-b2b22ffc68f8)

This script helps manage WordPress sites using Docker containers. It provides functionality to create, enable/disable, and delete WordPress sites using a docker-compose file.

Installation
1. Clone the repository to your local machine.
2. Ensure that Docker and Docker Compose are installed on your system.
3. Open a terminal and navigate to the project directory.

Usage

The script accepts different commands and subcommands to perform specific actions. Here are the available commands:

----------------------------------------------------------------------------------------------------------------------
Create a WordPress Site

``` ./wordpress_script.sh create <site_name> ```

This command creates a new WordPress site with the given site name. It starts the necessary Docker containers and sets up the site. The site will be accessible at http://<site_name>. A corresponding entry will be added to the /etc/hosts file.

----------------------------------------------------------------------------------------------------------------------
Enable or Disable a WordPress Site

``` ./wordpress_script.sh enable <site_name> ```

``` ./wordpress_script.sh disable <site_name> ```

This command enables or disables the WordPress site. When enabled, the Docker containers will start, making the site accessible. When disabled, the containers will stop, making the site inaccessible.

----------------------------------------------------------------------------------------------------------------------
Delete a WordPress Site

``` ./wordpress_script.sh delete <site_name> ```

This command deletes the WordPress site. It stops the Docker containers, removes any associated volumes, and cleans up the site files.

----------------------------------------------------------------------------------------------------------------------
