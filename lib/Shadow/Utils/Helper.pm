package Shadow::Utils::Helper {
    use strict;
    use warnings;

    sub new {
        return "
            Command       Description
            -------       -----------
            install       Install dependencies
            start         Start routing
            stop          Stop routing
            restart       Restart the Shadow circuit
            status        View status\n\n";
    }
}

1;
