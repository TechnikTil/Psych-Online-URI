package;

import sys.FileSystem;
import sys.io.File;

class PostCompile
{
	public static function main():Void
	{
		var extension:String = switch(Sys.systemName()) {
			case 'Windows':
				'.exe';
			case 'Linux':
				'';
			default:
				throw Sys.systemName() + " is currently not supported for Psych Online URI!";
		};

		try {
			FileSystem.createDirectory('export/bin');
			FileSystem.rename('export/haxe/URIHandler$extension', 'export/bin/peo_uri$extension');
		} catch(e) {}
	}
}