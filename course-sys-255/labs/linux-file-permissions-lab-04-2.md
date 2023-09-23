# Linux File Permissions (Lab 04-2)

## Step 1:&#x20;

Bob password: Izzycat1

Alice password: Tessiedog1&#x20;

Charlie password: Lunadog1&#x20;

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

In the image above, I'm creating users and their passwords.&#x20;

## Step 2&#x20;

<figure><img src="../../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

In the image above, I add a new group for users called accounting, and I added alice and bob to the group. I added a new directory called accounting as well.

## Step 3

<figure><img src="../../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

The image above shows me messing around with the new accounting directory and experimenting with the different user permissions within the accounting group/directory.&#x20;

## Step 4

<figure><img src="../../.gitbook/assets/image (25).png" alt=""><figcaption></figcaption></figure>

In the image above I'm adding the group accounting to the accounting directory.

## Step 5&#x20;

<figure><img src="../../.gitbook/assets/image (26).png" alt=""><figcaption></figcaption></figure>

The image above shows me trying to write a file to the accounting directory as alice, which is in the group accounting. Alice can't write because the group doesn't have write permissions on the accounting directory. So with the command `chmod g+w /accounting/` I added the write permission to the group that's on the accounting directory. Then at the bottom of the image, you can see that it worked and that alice can now write to the accounting directory. &#x20;

## Step 6

Charlie, who isn't in the accounting group, can read the files under the accounting directory. I want to change this, so I use the command `chmod o-rwx /accounting/`. This removes read write and execute permissions from others under the accounting directory.&#x20;

<figure><img src="../../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>

You can see in the image above I was able to read the alicefile.txt file as the user charlie. After `chmod o-rwx /accounting/` you can see I try to read the same file, but it doesn't work.

## Step 7

<figure><img src="../../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

The image above is me experimenting with bob's permissions. Found out I can't write to the alicefile.txt file, but I can read it. Since the accounting group isn't attached to the alicefile.txt file, bob only has other permissions, which is r-- (just read). The group permissions are rw- (read and write). So if I add the accounting group to the file, I should be able to write to it. &#x20;

## Step 8&#x20;

<figure><img src="../../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

The image above is me changing the alicefile.txt file group from the alice group to the accounting group. The command `chmod o-r *` removes the read permission from others to all of the files under the accounting directory. Since I'm on user alice, I can only change the file that alice owns. "Operation not permitted" shows up for the file owned by bob and root.&#x20;

## Step 9&#x20;

<figure><img src="../../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>

The image above shows me logging in as bob and being able to write to the alicefile.txt because it now has the group accounting attached to it, and bob is in the accounting group.&#x20;

I log out of bob and log into alice. I changed the pwd to accounting. I list the files under accounting to see the alicfile.txt file permissions. I decide I only want alice to be able to read and write to the file, so I do the command `chmod -v 600 alicefile.txt`. 600 permissions = read and write only for the owner of the file.



sources:&#x20;

[https://opensource.com/article/19/8/linux-permissions-101](https://opensource.com/article/19/8/linux-permissions-101)&#x20;
