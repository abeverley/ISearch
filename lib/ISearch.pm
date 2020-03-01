package ISearch;
use Dancer2;

our $VERSION = '0.1';

get '/search' => sub {

    content_type 'application/json';

    my $return;

    my $q = query_parameters->get('q');

    if ($q)
    {
        my @data = (
            {
                type => 'person',
                value => 'Helen Walker',
            },
            {
                type => 'person',
                value => 'Henley Parker',
            },
            {
                type => 'role',
                value => 'ISMS Manager',
            },
            {
                type => 'documentation',
                value => 'Help Section',
            },
            {
                type => 'asset',
                value => 'Data Centre',
            },
            {
                type => 'risk_assessment',
                value => 'Cloud services risk assessment',
            },
            {
                type => 'incident',
                value => 'Loss of memory stick',
            },
            {
                type => 'dpia',
                value => 'Processing of customer data',
            }
        );

        my @return;

        foreach my $data (@data)
        {
            push @return, $data
                if $data->{value} =~ /\Q$q/i;
        }

        $return = {
            is_error => 0,
            results  => \@return,
        };
    }
    else {
        $return = {
            is_error => 1,
            error    => 'Missing q query parameter',
        };
    }

    return encode_json($return);
};

true;
