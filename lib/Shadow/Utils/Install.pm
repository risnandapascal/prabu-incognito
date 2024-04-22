package Shadow::Utils::Install {
    use strict;
    use warnings;
    use Shadow::Utils::Device;

    sub new {
        my %device  = Shadow::Utils::Device->new();
        my $stopTor = "systemctl stop tor";

        my %install = (
            "debian" => "apt-get install -y tor iptables",
            "fedora" => "dnf install -y tor iptables",
            "centos" => "yum -y install epel-release tor iptables",
            "void"   => "xbps-install -y tor iptables",
            "arch"   => "pacman -S --noconfirm tor iptables"
        );

        if ($device{distribution} eq "void") {
            $stopTor = "sv stop tor > /dev/null";
        }

        if (-e "/etc/init.d/tor") {
            $stopTor = "/etc/init.d/tor stop > /dev/null";
        }

        system("$install{$device{distribution}} && $stopTor");

        return 1;
    }
}

1;
