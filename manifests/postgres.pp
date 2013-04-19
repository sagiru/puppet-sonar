class sonar::postgres($version = '9.1',$connection = ['127.0.0.1/32']){
    ## Postgres Konfigurationen
    class {'postgresql':
        version    => $version,
        connection => $connection,
    }

    # Erstelle Postgres User
    postgresql::user { 'sonar':
        ensure    => present,
        upassword => 'sonar',
        require   => Class['postgresql'],
        notify    => Service['sonar'],
    }

    # Erstelle Postgres DB
    postgresql::database { 'sonar':
        ensure  => present,
        dbowner => 'sonar',
        require => Class['postgresql'],
        notify  => Service['sonar'],
    }
}
