# getop for D


# Usage

```
import getopt : getopt, optarg, optind;

int main(string[] args)
{
        int flags;
        int nsecs, tfnd;
        int opt;
        tfnd = 0;
        flags = 0;
        while ((opt = getopt(args, "nt:")) != -1)
        {
                switch (opt)
                {
                        case 'n':
                                flags = 1;
                                break;
                        case 't':
                                nsecs = to!(int)(optarg);
                                tfnd = 1;
                                break;
                        default:        // >?
                                writefln("error");
                                return 1;
                }
        }
        writefln("flags=%s; tfnd=%s; nsecs=%s optind=%s", flags, tfnd, nsecs, optind);
        return 0;
}
```
