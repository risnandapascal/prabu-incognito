package Shadow::Utils::Status {
    use JSON;
    use strict;
    use warnings;
    use HTTP::Tiny;

    sub new {
        my $apiCheck = "https://check.torproject.org/api/ip";
        my $request  = HTTP::Tiny->new->get($apiCheck);
        
        if ($request->{success}) {
            my $data = decode_json($request->{content});

            my $checkIp  = $data->{"IP"};
            my $checkTor = $data->{"IsTor"} ? "active" : "inactive";

            return "\n[+] Status: $checkTor\n[+] Ip: $checkIp\n\n";
        }

        return "\n[!] ERROR: Sorry, unable to establish connection to the server.\n\n";
    }
}

1;
