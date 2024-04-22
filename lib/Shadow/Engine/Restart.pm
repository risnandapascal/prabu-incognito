package Shadow::Engine::Restart {
    use strict;
    use warnings;
    use Shadow::Engine::Stop;
    use Shadow::Engine::Start;

    sub new {
        my $stop = Shadow::Engine::Stop->new();

        if ($stop) {
            my $start = Shadow::Engine::Start->new();

            if ($start) {
                return 1;
            }
        }

        return 0;
    }
}

1;
