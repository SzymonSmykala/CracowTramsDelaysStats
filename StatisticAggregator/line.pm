package line;


sub new {
    my $class = shift;
    my $_delays_sum = 0;
    my $_delays_count = 0;
    my $self = {
        _line_id => shift,
    };
    bless $self, $class;

    return $self;
}

sub add_delay {
    my ( $self, $delay ) = @_; 
    $self->{_delays_count} =  $self->{_delays_count} + 1;
    $self->{_delays_sum} = $self->{_delays_sum} + $delay;
}   

sub get_avg_delay {
    my ( $self ) = @_; 
    return $self->{_delays_sum} / $self->{_delays_count};
}

sub to_string {
    my ( $self ) = @_; 
    return $self->{_line_id} . " " .  $self->{_delays_sum} . " " . $self->{_delays_count} . "\n";
}

1;