package Catalyst::Plugin::Session::PerUser::AutoLogout;
use Moose;
extends 'Catalyst::Plugin::Session::PerUser';

after set_authenticated => sub {
    my $c = shift;
    if (my $existing_session = $c->user_session->{session_id}) {
        $c->delete_session($existing_session);
    }
    $c->user_session->{session_id} = $c->sessionid;
};

1;
