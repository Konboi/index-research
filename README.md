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
Rate player_id index_id use no index player_id index_id use player_id index player_id index_id use uniq index player_id index_id use player_id index_id index
player_id index_id use no index                 90.9/s                              --                                   -64%                              -73%                                            -73%
player_id index_id use player_id index           250/s                            175%                                     --                              -25%                                            -25%
player_id index_id use uniq index                333/s                            267%                                    33%                                --                                             -0%
player_id index_id use player_id index_id index  333/s                            267%                                    33%                               -0%                                              --
```

```
Rate player_id use no index player_id use player_id index_id index player_id use player_id index player_id use uniq index
player_id use no index                 76.9/s                     --                                   -54%                          -62%                     -62%
player_id use player_id index_id index  167/s                   117%                                     --                          -17%                     -17%
player_id use player_id index           200/s                   160%                                    20%                            --                       0%
player_id use uniq index                200/s                   160%                                    20%                            0%                       --
```
