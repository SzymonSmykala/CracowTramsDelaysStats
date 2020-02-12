package vehicle;

use strict;
use warnings;
use Time::Piece;

sub new{
    my $class = shift;
    my $self = {
        _direction => shift,
        _line_id => shift,
        _status => shift,
        _planned_time => shift,
        _trip_id => shift,
        _actual_time => shift   
    };
    bless $self, $class;

    return $self;
}

sub toString {
    my ( $self ) = @_;
    return $self->{_direction} . " " .  $self->{_line_id} . " " . $self->{_status} . " " .  $self->{_planned_time} . " " . $self->{_actual_time}; 
}

sub get_delay_in_minutes {
    my ( $self ) = @_;
    my $planned_date_time = Time::Piece->strptime($self->{_planned_time}, '%H:%M');
    my $actual_date_time = Time::Piece->strptime($self->{_actual_time}, '%H:%M');
    my $seconds = $actual_date_time - $planned_date_time;
    my $minutes = $seconds / 60;
    return $minutes;
}

sub get_trip_id {
    my ( $self ) = @_;
    return $self->{_trip_id};
}

sub get_line_id {
    my ( $self ) = @_;
    return $self->{_line_id};
}

1;