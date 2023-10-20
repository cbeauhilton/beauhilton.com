# How to add a mirror to a single ZFS disk

<time id="post-date">2023-10-22</time>

<p id="post-excerpt">
tl;dr: zpool attach data /dev/disk/by-partlabel/zfs-3a1e459c75dc9b74 /dev/sda1. Adjust for your own pool and disks.
</p>


## A mirror is a Very Good Thing

I got a second identical disk to add as a ZFS mirror to my existing setup.

Redundancy FTW. 
ZFS is king and queen. 
Needs at least two disks to reap the full benefit
(though a single-disk setup is still rad -
CoW with snapshots and send/receive are worth it,
and NixOS makes it easy to set up).

## It's all about the disk path

The basic command is (as a super user, or using sudo):

```sh
zpool attach name-of-the-pool disk-you-already-had disk-you-want-to-add
```

On Linux, with a new drive, 
no need for formatting or any other disk preparation. 
Just plug it in.

But how to specify which disks to use in the command? 
I saw several guides that just used `/dev/sdx`, but it didn't work.

In my setup, `/dev/sdb` was my existing drive 
and `/dev/sda` is the one I was trying to add 
(these names are determined at boot time 
and can vary from boot to boot - 
ZFS takes care of finding things again on the back end 
after you've added a drive, 
regardless of the label you used to add it, 
so using the `/dev/sdx` name is just fine in many situations).

However, using
```sh
zpool attach data /dev/sdb dev/sda
```

gave me:

```sh
cannot attach /dev/sda to /dev/sdb: no such device in pool
``````

I tried a bunch of different things, from just the lsblk name with the partition ("sdb1"),
to by-id ("ata-ST1400..."), to full path combinations, etc.

What finally worked was the 
by-partlabel identifier for the existing disk, 
combined with the /dev/sdx0 name of the new one.

A little `zdb -l` on the existing drive gave me the path I wanted:

```sh
zdb -l /dev/sdb1
------------------------------------
LABEL 0
------------------------------------
    version: 5000
    name: 'data'
    state: 0
    txg: 170113
    pool_guid: 8237228336559358688
    errata: 0
    hostid: 3236406100
    hostname: 'dell7050'
    top_guid: 11182661003591634341
    guid: 11182661003591634341
    vdev_children: 1
    vdev_tree:
        type: 'disk'
        id: 0
        guid: 11182661003591634341
        path: '/dev/disk/by-partlabel/zfs-3a1e459c75dc9b74'
        whole_disk: 1
        metaslab_array: 128
        metaslab_shift: 34
        ashift: 12
        asize: 14000504438784
        is_log: 0
        DTL: 3865
        create_txg: 4
    features_for_read:
        com.delphix:hole_birth
        com.delphix:embedded_data
    labels = 0 1 2 3
```

So I tried:

```sh
zpool attach data /dev/disk/by-partlabel/zfs-3a1e459c75dc9b74 /dev/sda1
```

## Great success

```sh
zpool status

  pool: data
 state: ONLINE
status: One or more devices is currently being resilvered.  The pool will
        continue to function, possibly in a degraded state.
action: Wait for the resilver to complete.
  scan: resilver in progress since Thu Oct 19 17:05:26 2023
        2.33T scanned at 1.90G/s, 252G issued at 205M/s, 3.77T total
        252G resilvered, 6.53% done, 04:59:42 to go
config:

        NAME                      STATE     READ WRITE CKSUM
        data                      ONLINE       0     0     0
          mirror-0                ONLINE       0     0     0
            zfs-3a1e459c75dc9b74  ONLINE       0     0     0
            sda1                  ONLINE       0     0     0  (resilvering)

errors: No known data errors
```
