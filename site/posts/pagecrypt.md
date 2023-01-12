# password protecting static web pages

<time id="post-date">2023-01-12</time>

<p id="post-excerpt">
Static site generators, by and large, do not have support for password protecting individual pages. 
This post shows a strategy that works for any SSG and does not require server access controls.
</p>

[PageCrypt](https://github.com/Greenheart/pagecrypt) is the tool I went with.
It's a TypeScript library that uses the native `Web Crypto API` to encrypt html pages,
stuff the encrypted gobbledigook behind a simple password form,
and decrypt the page when the correct key is given.

I'm using the CLI version, but there are also native TypeScript and Node.js versions. 

The basic idea is this, taken from their docs:

```sh
npx pagecrypt <src> <dest> [password] [options]
```

Below is an excerpt from a `package.json` for a Hugo site I maintain.
First I build the site, then run the `postbuild` command, 
which stitches together a piece of code that creates a list of all the pages we'd like to encrypt
and another bit that does the encryption proper.

## give me the code already

```json

{
    "make-pw-files-file": "grep -rlF 'password_required: true' content | sed s+\\.md+\\/index.html+g | sed s+content/+public/+g > pw_file",
    "protect-files": "cat pw_file | while read f || [[ -n $f ]]; do npx pagecrypt $f $f $PAGECRYPT; done",
    "postbuild": "npm run -s make-pw-files-file && npm run -s protect-files ",
}

```

<br>

## ok, so how does it work?

<br>

### `make-pw-files-file` 

```sh
grep -rlF 'password_required: true' content | sed s+\\.md+\\/index.html+g | sed s+content/+public/+g > pw_file
```
This part uses a few standard Unix commands, the ubiquitous `grep` and `sed`. 

First it creates a list of markdown source files that have the header `password_required: true`.

Here's how that part works:

```sh
grep -rlF "text you're looking for" path/to/files/of/interest
```

- `-r` or `--recursive` searches though the sub-directories of whichever path you gave it
- `l` or `--files-with-matches` prints the filenames of any files that match the search
- `F` or `--fixed-strings` searches for the exact string you ask for, not using regular expressions

This will output something like:

```sh
content/file.md
content/file7.md
content/yet_another_file.md
```

Next it passes that to `sed`, which replaces `.md` with `/index.html`\* 
resulting in:

```sh
content/file/index.html
content/file7/index.html
content/yet_another_file/index.html
```

\* you'd have to adjust this command if you aren't using a page-per-folder style

Then it switches out `content/` with `public/`, leading to the final list:


```sh
public/file/index.html
public/file7/index.html
public/yet_another_file/index.html
```

and sends those to a file. 

Sending the list to a file is not necessary,
could just pipe it again to the stuff in `protect-files`,
but I was getting itchy at how long the command was getting.

<br>

### `protect-files`

```sh
cat pw_file | while read f || [[ -n $f ]]; do npx pagecrypt $f $f $PAGECRYPT; done
```

This part emits the contents of `pw_file`,
then loops through each line (`while read f || [[ -n $f ]]`)
and encrypts the corresponding file (`do npx pagecrypt`), 
finally saving it back to itself (`$f $f`).

`$PAGECRYPT` is an environment variable that specifies the password.

You could also set a password-per-page, 
either auto-generated (but you'd have to figure out how to get that password to your users), 
or using something like another header value in the `.md` files that you grep for and save somewhere.
For my use case, this is simpler and scales well.

<br>

### and that's it

As always, [let me know](../../contact) if you have any questions or know of a better way.
