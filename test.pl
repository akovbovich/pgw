#!/usr/bin/perl
use strict;
use warnings;

$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

# Для всех коннектов требуется использовать какой-нибудь HTTPS-proxy
#$ENV{HTTPS_PROXY} = 'https://92.46.125.177:3128';

# В зависимости от версий модулей LWP, Crypt-SSLeay и IO::Socket::SSL
# может отличаться порядок их загрузки и модуль по-умолчанию.
#use Net::HTTPS;
#$Net::HTTPS::SSL_SOCKET_CLASS = 'Net::SSL';

use Net::SSL;

use TestModule1;
use TestModule2;
use TestModule3;

# Сервер поддерживает старые SSL-протоколы, исторически используется Net::SSL
print TestModule1->connect('https://api.ipify.org/');

# Сервер поддерживает только TLS 1.2, требуется использовать IO::Socket::SSL
print TestModule2->connect('https://fancyssl.hboeck.de/');

# Сервер поддерживает старые SSL-протоколы, требуется использовать Net::SSL
print TestModule3->connect('https://api.ipify.org/');

print "\nDone\n";
