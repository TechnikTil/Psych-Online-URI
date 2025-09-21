package;

import haxe.io.Path;
import sys.io.Process;
import sys.io.File;

class URIHandler
{
	public static function main():Void
	{
		Sys.setCwd(Path.directory(Sys.programPath()));

		var gamePath:Null<String> = null;

		try {
			gamePath = haxe.Json.parse(File.getContent('peo_uri_data.json')).lastAppDir;
		} catch(e) {
			return;
		}

		var uriThing:String = Sys.args()[0];
		uriThing = uriThing.substring('psych-online://'.length);
		var args:Array<String> = uriThing.split('/');
		var command:String = args.shift();

		var gameArgs:Array<String> = [];

		switch(command)
		{
			case 'replay':
				var replayID:String = args.join('/');
				gameArgs = ['--replay', replayID];
		}

		Sys.setCwd(Path.directory(gamePath));
		new Process(gamePath, gameArgs);
	}
}