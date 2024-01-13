---
title: "0x03 - OverTheWire - Bandit "
tag: "0x03"
category: "do it"
date: "1/12/2024 10:00 PM"
---

So, I thought why not take a step back and go through the basics again, and this OTW Bandits was recommended by a lot of CTF guides, and here we are.

A bit of context about the program - OverTheWire offers training in the form of what they call war games. These war games vary in difficulty and begin with the easiest one called Bandit, gradually increasing in complexity. Each wargame consists of multiple levels that must be completed sequentially to finish the entire wargame.

Here we go:

## Bandit Level 0 - 34:

### Level 0

**Level Goal:**

*The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. The username is bandit0 and the password is bandit0. Once logged in, go to the Level 1 page to find out how to beat Level 1.*

**Solution:**

```ssh bandit0@bandit.labs.overthewire.org -p 2220```

### Level 1

**Level Goal:**

*The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.*

**Solution:**

Reading the contents of the file containing the password
* ```cat readme```

SSH to the next challenge:
* ```ssh bandit1@bandit.labs.overthewire.org -p 2220```

### Level 2

**Level Goal:**

*The password for the next level is stored in a file called - located in the home directory*

**Solution:**

Finding the password in the ```-``` file:
* ```cat ./-```

SSH to the next challenge:
* ```ssh bandit2@bandit.labs.overthewire.org -p 2220```

*What a weird type of file*

### Level 3

**Level Goal:**

*The password for the next level is stored in a file called spaces in this filename located in the home directory*

**Solution:**

Finding the password in the spaces file:
* ```cat spaces\ in\ this\ filename```

SSH to the next challenge:
* ```ssh bandit3@bandit.labs.overthewire.org -p 2220```

### Level 4

**Level Goal:**

*The password for the next level is stored in a hidden file in the inhere directory.*

**Solution:**

Finding the password in the hidden file:
* ```cd inhere```
* ```cat .hidden```

SSH to the next challenge:
* ```ssh bandit4@bandit.labs.overthewire.org -p 2220```

### Level 5

**Level Goal:**

*The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.*

**Solution:**

Finding the password in the hidden file:
* ```cd inhere```
* ```file ./-file0*``` - To find the file with the ASCII contents.
* ```cat ./-file07```

SSH to the next challenge:
* ```ssh bandit5@bandit.labs.overthewire.org -p 2220```

### Level 6

**Level Goal:**

*The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:*

*human-readable*
*1033 bytes in size*
*not executable*

**Solution:**

Finding the password in the hidden file:
* ```cd inhere```
* ```find ./ -type f -size 1033c -exec file {} + | grep -E 'ASCII|text' | grep -v 'executable'``` - To find the file with the ASCII contents.
* ```cat maybehere07/.file2```

SSH to the next challenge:
* ```ssh bandit6@bandit.labs.overthewire.org -p 2220```

### Level 7

**Level Goal:**

*The password for the next level is stored somewhere on the server and has all of the following properties:*

*owned by user bandit7*
*owned by group bandit6*
*33 bytes in size*

**Solution:**

Finding the password in the hidden file:
* ```cd inhere```
* ```find / -user bandit7 -group bandit6 -size 33c 2>/dev/null``` - To find the file with the required characteristics.
* ```cat /var/lib/dpkg/info/bandit7.password```

SSH to the next challenge:
* ```ssh bandit7@bandit.labs.overthewire.org -p 2220```

### Level 8

**Level Goal:**

*The password for the next level is stored in the file data.txt next to the word millionth*

**Solution:**

Finding the password in the hidden file:
* ```cat data.txt | grep millionth```

SSH to the next challenge:
* ```ssh bandit8@bandit.labs.overthewire.org -p 2220```

### Level 9

**Level Goal:**

*The password for the next level is stored in the file data.txt and is the only line of text that occurs only once*

**Solution:**

Finding the password in the hidden file:
* ```grep -x -F -v -f <(sort data.txt | uniq -d) data.txt```

SSH to the next challenge:
* ```ssh bandit9@bandit.labs.overthewire.org -p 2220```

### Level 10

**Level Goal:**

*The password for the next level is stored in the file data.txt and is the only line of text that occurs only once*

**Solution:**

Finding the password in the hidden file:
* ```strings data.txt | grep ==```

SSH to the next challenge:
* ```ssh bandit10@bandit.labs.overthewire.org -p 2220```

### Level 11

**Level Goal:**

*The password for the next level is stored in the file data.txt, which contains base64 encoded data*

**Solution:**

Finding the password in the hidden file:
* ```base64 -d data.txt```

SSH to the next challenge:
* ```ssh bandit11@bandit.labs.overthewire.org -p 2220```

### Level 12

**Level Goal:**

*The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions*

**Solution:**

Finding the password in the hidden file:
* ```cat data.txt | tr 'a-zA-Z' 'n-za-mN-ZA-M'```

SSH to the next challenge:
* ```ssh bandit12@bandit.labs.overthewire.org -p 2220```

### Level 13

**Level Goal:**

*The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)*

**Solution:**

Finding the password in the hidden file:
* Make the appropriate directories:
  ```
  mkdir /tmp/level13
  ```
* Follow the following for decompressing
```
bandit12@bandit:/tmp/level13$ cp ~/data.txt .
!
bandit12@bandit:/tmp/level13$ xxd -r data.txt > data
!
bandit12@bandit:/tmp/level13$ gunzip data
!
bandit12@bandit:/tmp/level13$ mv data data.gz
!
bandit12@bandit:/tmp/level13$ gunzip data.gz
!
bandit12@bandit:/tmp/level13$ mv data data.bz2
!
bandit12@bandit:/tmp/level13$ bzip2 -d data.bz2 
!
bandit12@bandit:/tmp/level13$ mv data data.gz
!
bandit12@bandit:/tmp/level13$ gunzip data.gz
!
bandit12@bandit:/tmp/level13$ mv data data.tar
!
bandit12@bandit:/tmp/level13$ tar -xf data.tar
!
bandit12@bandit:/tmp/level13$ mv data5.bin data5.tar
!
bandit12@bandit:/tmp/level13$ tar -xf data5.tar
!
bandit12@bandit:/tmp/level13$ mv data6.bin data6.bz2
!
bandit12@bandit:/tmp/level13$ bzip2 -d data6.bz2
!
bandit12@bandit:/tmp/level13$ mv data6 data6.tar
!
bandit12@bandit:/tmp/level13$ tar -xf data6.tar
! 
bandit12@bandit:/tmp/level13$ mv data8.bin data8.gz
!
bandit12@bandit:/tmp/level13$ gunzip data8.gz 
!
bandit12@bandit:/tmp/level13$ cat data8
```

SSH to the next challenge:
* ```ssh bandit13@bandit.labs.overthewire.org -p 2220```

### Level 14

**Level Goal:**

*The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on*

**Solution:**

Now the format has changed a bit because in this challenge we are given ssh private key and we have to use that private key to access the next level:

```bash
ssh -i "sshkey.private" bandit14@localhost -p 2220
```

### Level 15

**Level Goal:**

*The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.*

**Solution:**

For this challenge we have to submit the password of this level to get the password of the next level...

```bash
cat /etc/bandit_pass/bandit14
```

```bash
nc localhost 30000
```

SSH to the next challenge:
* ```ssh bandit15@bandit.labs.overthewire.org -p 2220```


### Level 16

**Level Goal:**

*The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption.*

*Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…*

**Solution:**

For this challenge we have to submit the password of this level to retrieve the password of the next challenge...
```bash
openssl s_client -connect localhost:30001
```

SSH to the next challenge:
* ```ssh bandit16@bandit.labs.overthewire.org -p 2220```

