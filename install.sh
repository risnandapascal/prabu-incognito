#!/bin/bash

install_package() {
    PACKAGE=$1
    echo "Installing $PACKAGE..."
    sudo apt install -y $PACKAGE
}

PACKAGES=(
    "tor"
    "iptables"
    "macchanger"
    "riseup-vpn"
    "ufw"
    "debsums"
    "exiftool"
    "rkhunter"
    "htop"
)

for PACKAGE in "${PACKAGES[@]}"; do
    install_package $PACKAGE
done

PERL_MODULES=(
    "Try::Tiny"
    "Config::Simple"
    "JSON"
)

for MODULE in "${PERL_MODULES[@]}"; do
    echo "Installing Perl module $MODULE..."
    sudo cpan install $MODULE
done

echo "All installations are complete!"
