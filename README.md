# search mysql index effect

- prepqre

```
carton instal
```

- prepare data

```
$ mysql -u root
mysql>  create database index_research
$ carton exec perl prepare_data.pl
```

- result

```
$ carton exec perl research.pl
```

```
Rate player_id index_id use no index player_id index_id use player_id index player_id index_id use player_id index_id index
player_id index_id use no index                 100.0/s                              --                                   -30%                                            -70%
player_id index_id use player_id index            143/s                             43%                                     --                                            -57%
player_id index_id use player_id index_id index   333/s                            233%                                   133%                                              --
```

```
Rate player_id use no index player_id use player_id index player_id use player_id index_id index
player_id use no index                 90.9/s                     --                          -55%                                   -64%
player_id use player_id index           200/s                   120%                            --                                   -20%
player_id use player_id index_id index  250/s                   175%                           25%                                     --
```
