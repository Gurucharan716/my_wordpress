# !/bin/bash

check_dependencies() {
    if ! command -v docker &>/dev/null || ! command -v docker-compose &>/dev/null; then
        install_dependencies
    fi
}

install_dependencies() {
    sudo apt update
    sudo apt install -y docker.io docker-compose
    echo "Dependencies installed successfully."
}

create_wordpress_site() {
    cd /c/Users/HP/OneDrive/Documents/my_wordpress || exit
    docker-compose up -d
    echo "WordPress site created successfully."
    echo "Please open http://$site_name in your browser to access the WordPress site."
}

add_hosts_entry() {
    echo "127.0.0.1       $site_name" | tee -a /etc/hosts >/dev/null
    echo "Hosts entry added successfully."
}

enable_disable_site() {
    cd /c/Users/HP/OneDrive/Documents/my_wordpress || exit
    if [[ $1 == "enable" ]]; then
        docker-compose start
        echo "Site enabled successfully."
    elif [[ $1 == "disable" ]]; then
        docker-compose stop
        echo "Site disabled successfully."
    else
        echo "Invalid enable/disable command. Please use 'enable' or 'disable'."
        exit 1
    fi
}

delete_site() {
    cd /c/Users/HP/OneDrive/Documents/my_wordpress || exit
    docker-compose down -v
    echo "Site deleted successfully."
}

main() {
    if [[ $# -lt 2 ]]; then
        echo "Please provide a subcommand and a site name."
        exit 1
    fi

    subcommand=$1
    site_name=$2

    check_dependencies

    case $subcommand in
        create)
            create_wordpress_site
            add_hosts_entry "$site_name"
            ;;
        enable|disable)
            enable_disable_site "$subcommand"
            ;;
        delete)
            delete_site
            ;;
        *)
            echo "Invalid subcommand. Please use 'create', 'enable', 'disable', or 'delete'."
            exit 1
            ;;
    esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi