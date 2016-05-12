.. image:: https://coveralls.io/repos/bibi21000/janitoo_docker_tests/badge.svg?branch=master&service=github
    :target: https://coveralls.io/github/bibi21000/janitoo_docker_tests?branch=master
    :alt: Coveralls results


====================
Janitoo docker image
====================

The test docker image of Janitoo.

Actually this image fails in timeout on docker hub ... because it takes many hours.

Tests features :
 - it launch every server and look for errors in log.
 - some server specific bugs are also checked : ie janitoo_datalog_rrd
 - sqlite, mysql and postgresql are installed and running with a default janitoo_tests database ie janitoo_layouts

To launch the tests :

Retrieve the docker image from docker hub :

.. code:: bash

    make docker-image-pull

And launch the tests

.. code:: bash

    make docker-image-tests

At last, be patient ...

After some hours, you'll get something like :

.. code:: bash

    Name                                                                                              Stmts   Miss  Cover
    ---------------------------------------------------------------------------------------------------------------------
    /opt/janitoo/src/janitoo/src/janitoo/__init__.py                                                      4      0   100%
    /opt/janitoo/src/janitoo/src/janitoo/_compat.py                                                      46     29    37%
    /opt/janitoo/src/janitoo/src/janitoo/bus.py                                                         171     49    71%
    /opt/janitoo/src/janitoo/src/janitoo/classes.py                                                       9      0   100%
    /opt/janitoo/src/janitoo/src/janitoo/component.py                                                    65      9    86%
    /opt/janitoo/src/janitoo/src/janitoo/dhcp.py                                                       1442    757    48%
    /opt/janitoo/src/janitoo/src/janitoo/mqtt.py                                                        134     27    80%
    /opt/janitoo/src/janitoo/src/janitoo/node.py                                                       1142    344    70%
    /opt/janitoo/src/janitoo/src/janitoo/options.py                                                     154     63    59%
    /opt/janitoo/src/janitoo/src/janitoo/rfid.py                                                        110      7    94%
    /opt/janitoo/src/janitoo/src/janitoo/runner.py                                                      221    140    37%
    /opt/janitoo/src/janitoo/src/janitoo/server.py                                                      323     88    73%
    /opt/janitoo/src/janitoo/src/janitoo/tests.py                                                        62      2    97%
    /opt/janitoo/src/janitoo/src/janitoo/thread.py                                                      145     31    79%
    /opt/janitoo/src/janitoo/src/janitoo/utils.py                                                        70     18    74%
    /opt/janitoo/src/janitoo/src/janitoo/value.py                                                       103     17    83%
    /opt/janitoo/src/janitoo/src/janitoo/value_factory.py                                               240     49    80%
    /opt/janitoo/src/janitoo_bluez/src/janitoo_bluez/__init__.py                                          4      0   100%
    /opt/janitoo/src/janitoo_bluez/src/janitoo_bluez/bus_bluez.py                                        37      5    86%
    /opt/janitoo/src/janitoo_bluez/src/janitoo_bluez/components.py                                       88     12    86%
    /opt/janitoo/src/janitoo_bluez/src/janitoo_bluez/thread_bluez.py                                     30      1    97%
    /opt/janitoo/src/janitoo_datalog_rrd/src/janitoo_datalog_rrd/__init__.py                              4      0   100%
    /opt/janitoo/src/janitoo_datalog_rrd/src/janitoo_datalog_rrd/bus.py                                 487    166    66%
    /opt/janitoo/src/janitoo_datalog_rrd/src/janitoo_datalog_rrd/components.py                           95      7    93%
    /opt/janitoo/src/janitoo_datalog_rrd/src/janitoo_datalog_rrd/server.py                               24      5    79%
    /opt/janitoo/src/janitoo_datalog_rrd/src/janitoo_datalog_rrd/thread.py                               28      1    96%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/__init__.py                                                4      0   100%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/base.py                                                   16      0   100%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/helpers.py                                                36     22    39%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/migrate.py                                                86     22    74%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/models/__init__.py                                        18      0   100%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/models/user.py                                           188     98    48%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/models/utils.py                                           60     23    62%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/security.py                                              133     89    33%
    /opt/janitoo/src/janitoo_db/src/janitoo_db/server.py                                                 79      3    96%
    /opt/janitoo/src/janitoo_dhcp/src/janitoo_dhcp/__init__.py                                            4      0   100%
    /opt/janitoo/src/janitoo_dhcp/src/janitoo_dhcp/lease.py                                             159    129    19%
    /opt/janitoo/src/janitoo_dhcp/src/janitoo_dhcp/models.py                                             38      1    97%
    /opt/janitoo/src/janitoo_dhcp/src/janitoo_dhcp/network.py                                            34     14    59%
    /opt/janitoo/src/janitoo_dhcp/src/janitoo_dhcp/server.py                                            284    233    18%
    /opt/janitoo/src/janitoo_events/src/janitoo_events/__init__.py                                        6      0   100%
    /opt/janitoo/src/janitoo_events/src/janitoo_events/bus.py                                            82     18    78%
    /opt/janitoo/src/janitoo_events/src/janitoo_events/component.py                                     135     30    78%
    /opt/janitoo/src/janitoo_events/src/janitoo_events/thread.py                                         37      1    97%
    /opt/janitoo/src/janitoo_events_cron/src/janitoo_events_cron/__init__.py                              6      0   100%
    /opt/janitoo/src/janitoo_events_cron/src/janitoo_events_cron/bus.py                                  48      0   100%
    /opt/janitoo/src/janitoo_events_cron/src/janitoo_events_cron/component.py                            24      0   100%
    /opt/janitoo/src/janitoo_events_earth/src/janitoo_events_earth/__init__.py                            6      0   100%
    /opt/janitoo/src/janitoo_events_earth/src/janitoo_events_earth/bus.py                                44      0   100%
    /opt/janitoo/src/janitoo_events_earth/src/janitoo_events_earth/component.py                          24      0   100%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/__init__.py                                      4      0   100%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/threads/__init__.py                              4      0   100%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/threads/email.py                                27      3    89%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/threads/http.py                                286     63    78%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/threads/remote.py                              170     19    89%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/threads/scenes.py                              101     51    50%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/__init__.py                               4      0   100%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/action.py                                99     18    82%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/basic.py                                 53      5    91%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/config.py                               149     23    85%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/other.py                                 95     26    73%
    /opt/janitoo/src/janitoo_factory/src/janitoo_factory/values/sensor.py                               194     19    90%
    /opt/janitoo/src/janitoo_hostsensor/src/janitoo_hostsensor/__init__.py                                4      0   100%
    /opt/janitoo/src/janitoo_hostsensor/src/janitoo_hostsensor/hostsensor.py                             79      2    97%
    /opt/janitoo/src/janitoo_hostsensor/src/janitoo_hostsensor/server.py                                 17      5    71%
    /opt/janitoo/src/janitoo_hostsensor_lmsensor/src/janitoo_hostsensor_lmsensor/__init__.py              4      0   100%
    /opt/janitoo/src/janitoo_hostsensor_lmsensor/src/janitoo_hostsensor_lmsensor/component.py            88      6    93%
    /opt/janitoo/src/janitoo_hostsensor_psutil/src/janitoo_hostsensor_psutil/__init__.py                  4      0   100%
    /opt/janitoo/src/janitoo_hostsensor_psutil/src/janitoo_hostsensor_psutil/component.py               405     89    78%
    /opt/janitoo/src/janitoo_hostsensor_raspberry/src/janitoo_hostsensor_raspberry/__init__.py            4      0   100%
    /opt/janitoo/src/janitoo_hostsensor_raspberry/src/janitoo_hostsensor_raspberry/component.py          67      0   100%
    /opt/janitoo/src/janitoo_lapinoo/src/janitoo_lapinoo/__init__.py                                      4      0   100%
    /opt/janitoo/src/janitoo_lapinoo/src/janitoo_lapinoo/server.py                                       24      0   100%
    /opt/janitoo/src/janitoo_layouts/src/janitoo_layouts/__init__.py                                      4      0   100%
    /opt/janitoo/src/janitoo_layouts/src/janitoo_layouts/bus.py                                          36      1    97%
    /opt/janitoo/src/janitoo_layouts/src/janitoo_layouts/models.py                                       58     23    60%
    /opt/janitoo/src/janitoo_layouts/src/janitoo_layouts/thread.py                                       28      1    96%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/__init__.py                                      5      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/_compat.py                                       9      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/admin/__init__.py                                7      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/admin/views.py                                  62     18    71%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/app.py                                         111     75    32%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/auth/__init__.py                                 0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/auth/forms.py                                   57     11    81%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/auth/views.py                                   92     68    26%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/configs/__init__.py                              0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/configs/testing.py                              35      1    97%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/email.py                                        18      5    72%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/extensions.py                                   30      2    93%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/management/__init__.py                           0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/management/models.py                            50     32    36%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/portal/__init__.py                               0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/portal/views.py                                 23      3    87%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/user/__init__.py                                 0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/user/forms.py                                   60     15    75%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/user/models.py                                  32      4    88%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/user/views.py                                   56     31    45%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/__init__.py                                0      0   100%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/database.py                               19      7    63%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/fields.py                                 21      9    57%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/helpers.py                               196    153    22%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/markup.py                                 54     20    63%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/permissions.py                            50     31    38%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/settings.py                               21      4    81%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/translations.py                           28     14    50%
    /opt/janitoo/src/janitoo_manager/src/janitoo_manager/utils/widgets.py                                61     42    31%
    /opt/janitoo/src/janitoo_nut/src/janitoo_nut/__init__.py                                              4      0   100%
    /opt/janitoo/src/janitoo_nut/src/janitoo_nut/nut.py                                                 119     12    90%
    /opt/janitoo/src/janitoo_nut/src/janitoo_nut/server.py                                               18      5    72%
    /opt/janitoo/src/janitoo_raspberry/src/janitoo_raspberry/__init__.py                                  4      0   100%
    /opt/janitoo/src/janitoo_raspberry/src/janitoo_raspberry/server.py                                   39      1    97%
    /opt/janitoo/src/janitoo_raspberry/src/janitoo_raspberry/thread_basic.py                             29      0   100%
    /opt/janitoo/src/janitoo_raspberry_1wire/src/janitoo_raspberry_1wire/__init__.py                      4      0   100%
    /opt/janitoo/src/janitoo_raspberry_1wire/src/janitoo_raspberry_1wire/bus_1wire.py                    38      2    95%
    /opt/janitoo/src/janitoo_raspberry_1wire/src/janitoo_raspberry_1wire/components.py                   67      9    87%
    /opt/janitoo/src/janitoo_raspberry_1wire/src/janitoo_raspberry_1wire/thread_1wire.py                 30      1    97%
    /opt/janitoo/src/janitoo_raspberry_camera/src/janitoo_raspberry_camera/__init__.py                    4      0   100%
    /opt/janitoo/src/janitoo_raspberry_camera/src/janitoo_raspberry_camera/camera.py                    310    175    44%
    /opt/janitoo/src/janitoo_raspberry_camera/src/janitoo_raspberry_camera/thread_camera.py              30      1    97%
    /opt/janitoo/src/janitoo_raspberry_dht/src/janitoo_raspberry_dht/__init__.py                          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_dht/src/janitoo_raspberry_dht/dht.py                              71      2    97%
    /opt/janitoo/src/janitoo_raspberry_fishtank/src/janitoo_raspberry_fishtank/__init__.py                4      0   100%
    /opt/janitoo/src/janitoo_raspberry_fishtank/src/janitoo_raspberry_fishtank/server.py                 24      0   100%
    /opt/janitoo/src/janitoo_raspberry_gpio/src/janitoo_raspberry_gpio/__init__.py                        4      0   100%
    /opt/janitoo/src/janitoo_raspberry_gpio/src/janitoo_raspberry_gpio/gpio.py                          462    263    43%
    /opt/janitoo/src/janitoo_raspberry_gpio/src/janitoo_raspberry_gpio/thread_gpio.py                    30      1    97%
    /opt/janitoo/src/janitoo_raspberry_i2c/src/janitoo_raspberry_i2c/__init__.py                          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c/src/janitoo_raspberry_i2c/bus_i2c.py                          44      1    98%
    /opt/janitoo/src/janitoo_raspberry_i2c/src/janitoo_raspberry_i2c/thread_i2c.py                       30      1    97%
    /opt/janitoo/src/janitoo_raspberry_i2c_ads1x15/src/janitoo_raspberry_i2c_ads1x15/__init__.py          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_ads1x15/src/janitoo_raspberry_i2c_ads1x15/ads.py              64      1    98%
    /opt/janitoo/src/janitoo_raspberry_i2c_bmp/src/janitoo_raspberry_i2c_bmp/__init__.py                  4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_bmp/src/janitoo_raspberry_i2c_bmp/bmp.py                     108      4    96%
    /opt/janitoo/src/janitoo_raspberry_i2c_bno055/src/janitoo_raspberry_i2c_bno055/__init__.py            4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_bno055/src/janitoo_raspberry_i2c_bno055/bno.py                66      1    98%
    /opt/janitoo/src/janitoo_raspberry_i2c_ds1307/src/janitoo_raspberry_i2c_ds1307/__init__.py            4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_ds1307/src/janitoo_raspberry_i2c_ds1307/ds1307.py             59      8    86%
    /opt/janitoo/src/janitoo_raspberry_i2c_ht16k33/src/janitoo_raspberry_i2c_ht16k33/__init__.py          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_ht16k33/src/janitoo_raspberry_i2c_ht16k33/ht16k33.py          54      3    94%
    /opt/janitoo/src/janitoo_raspberry_i2c_max9744/src/janitoo_raspberry_i2c_max9744/__init__.py          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_max9744/src/janitoo_raspberry_i2c_max9744/max.py              50      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_pca9685/src/janitoo_raspberry_i2c_pca9685/__init__.py          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_pca9685/src/janitoo_raspberry_i2c_pca9685/bus_pca9685.py      95     21    78%
    /opt/janitoo/src/janitoo_raspberry_i2c_pca9685/src/janitoo_raspberry_i2c_pca9685/pca9685.py         166     78    53%
    /opt/janitoo/src/janitoo_raspberry_i2c_vcnl40xx/src/janitoo_raspberry_i2c_vcnl40xx/__init__.py        4      0   100%
    /opt/janitoo/src/janitoo_raspberry_i2c_vcnl40xx/src/janitoo_raspberry_i2c_vcnl40xx/vcnl40xx.py       97      4    96%
    /opt/janitoo/src/janitoo_raspberry_lcdchar/src/janitoo_raspberry_lcdchar/__init__.py                  4      0   100%
    /opt/janitoo/src/janitoo_raspberry_lcdchar/src/janitoo_raspberry_lcdchar/bus_lcdchar.py              31      1    97%
    /opt/janitoo/src/janitoo_raspberry_lcdchar/src/janitoo_raspberry_lcdchar/lcdchar.py                  60      5    92%
    /opt/janitoo/src/janitoo_raspberry_lcdchar/src/janitoo_raspberry_lcdchar/thread_lcdchar.py           30      1    97%
    /opt/janitoo/src/janitoo_raspberry_sound/src/janitoo_raspberry_sound/__init__.py                      4      0   100%
    /opt/janitoo/src/janitoo_raspberry_sound/src/janitoo_raspberry_sound/sound.py                        55      6    89%
    /opt/janitoo/src/janitoo_raspberry_sound/src/janitoo_raspberry_sound/thread_sound.py                 30      1    97%
    /opt/janitoo/src/janitoo_raspberry_spi/src/janitoo_raspberry_spi/__init__.py                          4      0   100%
    /opt/janitoo/src/janitoo_raspberry_spi/src/janitoo_raspberry_spi/bus_spi.py                          99     43    57%
    /opt/janitoo/src/janitoo_raspberry_spi/src/janitoo_raspberry_spi/thread_spi.py                       30      1    97%
    /opt/janitoo/src/janitoo_thermal/src/janitoo_thermal/__init__.py                                      4      0   100%
    /opt/janitoo/src/janitoo_thermal/src/janitoo_thermal/thermal.py                                     148     26    82%
    /opt/janitoo/src/janitoo_thermal/src/janitoo_thermal/thread_thermal.py                               30      1    97%
    ---------------------------------------------------------------------------------------------------------------------
    TOTAL                                                                                             12591   4088    68%
    xunitmerge `ls .xunit/*.xml` nosetests.xml
    xunitreport nosetests.xml
    tests.test_docker.TestFakeSerser - test_020_request_broadcast                                        : success
    tests.test_docker.TestFakeSerser - test_040_server_start_no_error_in_log                             : success
    tests.test_docker.TestNetworkState - test_010_network_sfm_primary                                    : success
    tests.test_docker.TestNetworkState - test_050_network_sfm_secondary                                  : success
    tests.test_docker.TestNetworkState - test_060_network_sfm_secondary_fail                             : success
    tests.test_docker.TestNetworkState - test_100_network_state_primary                                  : success
    tests.test_docker.TestNetworkState - test_110_network_state_secondary                                : success
    tests.test_docker.TestNetworkState - test_120_network_state_secondary_fail                           : success
    tests.test_docker.TestRFID - test_001_block_current_version                                          : success
    tests.test_docker.TestRFID - test_005_block_bad                                                      : success
    tests.test_docker.TestRFID - test_006_block_upgrade                                                  : success
    tests.test_docker.TestRFID - test_010_block_decode_rfid_v1                                           : success
    tests.test_docker.TestRFID - test_100_tag_v1                                                         : success
    tests.test_docker.TestBluezSerser - test_020_request_broadcast                                       : success
    tests.test_docker.TestBluezSerser - test_040_server_start_no_error_in_log                            : success
    tests.test_docker.TestDatalogRRDSerser - test_020_request_broadcast                                  : success
    tests.test_docker.TestDatalogRRDSerser - test_040_server_start_no_error_in_log                       : failed
    tests.test_docker.Mysql - test_001_user                                                              : success
    tests.test_docker.Postgresql - test_001_user                                                         : errored
    tests.test_docker.Sqlite - test_001_user                                                             : success
    tests.test_docker.TestDBSerser - test_020_request_broadcast                                          : success
    tests.test_docker.TestDBSerser - test_040_server_start_no_error_in_log                               : failed
    tests.test_docker.TestDBSerser - test_051_dbserver_no_auto_migrate                                   : success
    tests.test_docker.TestDBSerser - test_052_dbserver_auto_migrate                                      : success
    tests.test_docker.Mysql - test_001_lease                                                             : success
    tests.test_docker.Postgresql - test_001_lease                                                        : errored
    tests.test_docker.Sqlite - test_001_lease                                                            : success
    tests.test_docker.TestEventsSerser - test_020_request_broadcast                                      : success
    tests.test_docker.TestEventsSerser - test_040_server_start_no_error_in_log                           : success
    tests.test_docker.TestEventsCronSerser - test_020_request_broadcast                                  : success
    tests.test_docker.TestEventsCronSerser - test_040_server_start_no_error_in_log                       : success
    tests.test_docker.TestEventsEarthSerser - test_020_request_broadcast                                 : success
    tests.test_docker.TestEventsEarthSerser - test_040_server_start_no_error_in_log                      : success
    tests.test_docker.TestHttpSerser - test_020_request_broadcast                                        : success
    tests.test_docker.TestHttpSerser - test_040_server_start_no_error_in_log                             : success
    tests.test_docker.TestRemoteSerser - test_020_request_broadcast                                      : success
    tests.test_docker.TestRemoteSerser - test_040_server_start_no_error_in_log                           : success
    tests.test_docker.TestHostsensorSerser - test_020_request_broadcast                                  : success
    tests.test_docker.TestHostsensorSerser - test_040_server_start_no_error_in_log                       : success
    tests.test_docker.TestHostsensorLmsensorSerser - test_020_request_broadcast                          : success
    tests.test_docker.TestHostsensorLmsensorSerser - test_040_server_start_no_error_in_log               : success
    tests.test_docker.TestHostsensorPsutilSerser - test_020_request_broadcast                            : success
    tests.test_docker.TestHostsensorPsutilSerser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestHostsensorRaspberrySerser - test_020_request_broadcast                         : success
    tests.test_docker.TestHostsensorRaspberrySerser - test_040_server_start_no_error_in_log              : success
    tests.test_docker.Mysql - test_001_layouts                                                           : success
    tests.test_docker.Postgresql - test_001_layouts                                                      : errored
    tests.test_docker.Sqlite - test_001_layouts                                                          : success
    tests.test_docker.TestLayoutsSerser - test_020_request_broadcast                                     : success
    tests.test_docker.TestLayoutsSerser - test_040_server_start_no_error_in_log                          : skipped
    tests.test_docker.TestManagerSerser - test_001_connect_to_server                                     : success
    tests.test_docker.TestMysqlSerser - test_001_connect_to_server                                       : success
    tests.test_docker.TestNutSerser - test_020_request_broadcast                                         : success
    tests.test_docker.TestNutSerser - test_040_server_start_no_error_in_log                              : success
    tests.test_docker.TestPostgresqlSerser - test_001_connect_to_server                                  : failed
    tests.test_docker.TestRaspberrySerser - test_020_request_broadcast                                   : success
    tests.test_docker.TestRaspberrySerser - test_040_server_start_no_error_in_log                        : success
    tests.test_docker.TestRaspberry1WireSerser - test_020_request_broadcast                              : success
    tests.test_docker.TestRaspberry1WireSerser - test_040_server_start_no_error_in_log                   : success
    tests.test_docker.TestRaspberryCameraSerser - test_020_request_broadcast                             : skipped
    tests.test_docker.TestRaspberryCameraSerser - test_040_server_start_no_error_in_log                  : success
    tests.test_docker.TestRaspberryDHTSerser - test_020_request_broadcast                                : success
    tests.test_docker.TestRaspberryDHTSerser - test_040_server_start_no_error_in_log                     : success
    tests.test_docker.TestRaspberryGPIOSerser - test_020_request_broadcast                               : success
    tests.test_docker.TestRaspberryGPIOSerser - test_040_server_start_no_error_in_log                    : success
    tests.test_docker.TestRaspberryI2CSerser - test_020_request_broadcast                                : success
    tests.test_docker.TestRaspberryI2CSerser - test_040_server_start_no_error_in_log                     : success
    tests.test_docker.TestRaspberryADS1X15Serser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryADS1X15Serser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberryBMPSerser - test_020_request_broadcast                                : success
    tests.test_docker.TestRaspberryBMPSerser - test_040_server_start_no_error_in_log                     : success
    tests.test_docker.TestRaspberryBNO055Serser - test_020_request_broadcast                             : success
    tests.test_docker.TestRaspberryBNO055Serser - test_040_server_start_no_error_in_log                  : success
    tests.test_docker.TestRaspberryDS1307Serser - test_020_request_broadcast                             : success
    tests.test_docker.TestRaspberryDS1307Serser - test_040_server_start_no_error_in_log                  : success
    tests.test_docker.TestRaspberryI2CFullSerser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryI2CFullSerser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberryHT16K33Serser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryHT16K33Serser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberryMAX9744Serser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryMAX9744Serser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberryPCA9685Serser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryPCA9685Serser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberryVCNL40XXSerser - test_020_request_broadcast                           : success
    tests.test_docker.TestRaspberryVCNL40XXSerser - test_040_server_start_no_error_in_log                : success
    tests.test_docker.TestRaspberryLCDCHARSerser - test_020_request_broadcast                            : success
    tests.test_docker.TestRaspberryLCDCHARSerser - test_040_server_start_no_error_in_log                 : success
    tests.test_docker.TestRaspberrySoundSerser - test_020_request_broadcast                              : success
    tests.test_docker.TestRaspberrySoundSerser - test_040_server_start_no_error_in_log                   : success
    tests.test_docker.TestRaspberrySPISerser - test_020_request_broadcast                                : success
    tests.test_docker.TestRaspberrySPISerser - test_040_server_start_no_error_in_log                     : success
    tests.test_docker.TestThermalSerser - test_020_request_broadcast                                     : success
    tests.test_docker.TestThermalSerser - test_040_server_start_no_error_in_log                          : success
    {'failed': 3, 'errored': 3, 'skipped': 2, 'run': 93, 'success': 85}

    Coverage finished.

