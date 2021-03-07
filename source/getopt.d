module getopt;
import std.string;

string	optarg;
int		optind = 0;
char nextchar;



int getopt(string[] args, string optstring)
{
	if (optind == 0) { optind = 1; }
	char argErrorChar = ((optstring.length >= 1) && (optstring[0] == ':')) ? ':' : '?';
	if (optind < args.length)
	{
		string target = strip(args[optind]);
		optind++;
		if ((target.length >= 2) && (target[0] == '-'))
		{
			long optidx = indexOf(optstring, target[1 .. $]);
			if (optidx >= 0)
			{
				bool isOptArgs = ((optidx + 1) < optstring.length) ? (optstring[optidx+1] == ':') : false;
				if (isOptArgs)
				{
					if (optind < args.length)
					{
						optarg = args[optind];
						optind++;
					}
					else
					{
						// 引数ありオプションであるが引数が無い場合エラーを返す。
						return argErrorChar; 
					}
				}
				return target[1];
			}
			// 指定以外のオプションの場合、'?' を返す。
			return '?';
		}
	}
	return -1;
}
