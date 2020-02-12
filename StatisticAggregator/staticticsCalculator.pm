package staticticsCalculator;
use File::Basename;
use lib dirname (__FILE__) . "/";
use line;

sub new{
    my $class = shift;
    my $self = {
        _dict => shift,
    };
    bless $self, $class;

    return $self;
}

sub print_line_ranking{
    my ( $self ) = @_;
    my %vehicles = $self->{_dict};
    my %lines = [];

   foreach my $key (sort(keys %vehicles)) {
        print $key, '=', $vehicles{$key}, "\n";
    }

    while ( ($k,$v) = each %vehicles ) {
        $v = $vehicles{$k};
        print "$k => $v\n";
        my $line_id = $v->get_line_id();
        my $current_line;
        if (exists($lines{$line_id}))
        {
            $current_line = $lines{$line_id};
        }else{
            $current_line = new line($line_id);
        }
        $current_line->add_delay(%vehicles{$line_id}->get_delay_in_minutes());
        print "LINE: ", $current_line->to_string();
        $lines{$line_id} = $current_line;
    }
}

1;