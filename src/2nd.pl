#!/usr/bin/perl -w
use strict;
use warnings;
use Mojolicious::Lite;
use File::Basename;

plugin 'RenderFile';

my @images = <images/*.gif>;
my @idnums = qw(20144174);
my %IDNUM;

foreach my $idnum ( @idnums ) {
	$IDNUM{$idnum} = basename(pop(@images));
}

get '/images/:file' => sub {
	my $self = shift;
	my $file = $self->param('file');
	$self->render_file('filepath' => "./images/$file.gif");
};

get '/' => sub {
	my $c = shift;
	$c->render('main');
};

get '/result' => sub {
	my $c = shift;
	my $idnum = $c->param('idnum');
	my $image = $IDNUM{$idnum};

	if ( $image ) {
		$c->render('result', idnum => $idnum, image => $image);
	} else {
		$c->render('fail');
	}
};

app->start;

__DATA__

@@ main.html.ep
<html>

<head>
<script>
process = function()
 {
    window.open('about:blank', 'popup', 'width=320,height=240,resizeable=no');
    document.result.setAttribute('target', 'popup');
    document.result.setAttribute('onsubmit', '');
    document.result.submit();
 };
</script>
</head>

<body>
<h1>2주차 과제</h1>
학번을 입력하고 OK를 눌러주세요.</p>

<form action="/result" method="get" name="result" onsubmit="process(); return false;">
학번: <input type="text" name="idnum" id="idnum" /> <input type="submit" value="확인"/>
</form>

</body>

</html>

@@ result.html.ep
<!DOCTYPE html>
<html>

<head>
<script language="JavaScript">

//////////F12 disable code////////////////////////
    document.onkeypress = function (event) {
        event = (event || window.event);
        if (event.keyCode == 123) {
           //alert('No F-12');
            return false;
        }
    }
    document.onmousedown = function (event) {
        event = (event || window.event);
        if (event.keyCode == 123) {
            //alert('No F-keys');
            return false;
        }
    }
document.onkeydown = function (event) {
        event = (event || window.event);
        if (event.keyCode == 123) {
            //alert('No F-keys');
            return false;
        }
    }
/////////////////////end///////////////////////

//Disable right click script 
//visit http://www.rainbow.arch.scriptmania.com/scripts/ 
var message="Sorry, right-click has been disabled"; 
/////////////////////////////////// 
function clickIE() {if (document.all) {(message);return false;}} 
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) { 
if (e.which==2||e.which==3) {(message);return false;}}} 
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;} 
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;} 
document.oncontextmenu=new Function("return false") 

function restrainIllegalOperation(){
	document.onkeydown = keyEventHandle;
	document.oncontextmenu = contextEventHandle; 
} 

function keyEventHandle(e) {
    // The information under keys is registered.
    var shift, ctrl, alt;
	
    // Mozilla(Firefox, NN) and Opera
    if (e != null) {
        keycode = e.which;
        ctrl    = typeof e.modifiers == 'undefined' ? e.ctrlKey : e.modifiers & Event.CONTROL_MASK;
        shift   = typeof e.modifiers == 'undefined' ? e.shiftKey : e.modifiers & Event.SHIFT_MASK;
        alt   = typeof e.modifiers == 'undefined' ? e.altKey : e.modifiers & Event.ALT_MASK;
    // Internet Explorer
    } else {
        keycode = event.keyCode;
        ctrl    = event.ctrlKey;
        shift   = event.shiftKey;
        alt     = event.altKey;
    }

    // Ctrl + R
    if((ctrl && keycode == 82) || (ctrl == 17 && keycode == 82)) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }
    
    // Ctrl
    if(ctrl || (ctrl == 17) ) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }
 
    // Ctrl + F5
    if((ctrl && keycode == 116) || (ctrl == 17 && keycode == 116)) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }
    
    // F12
    if(keycode == 123) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }
    
    // Alt 
    if((alt && keycode == 37) || (alt == 18 && keycode == 37)) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        }
        return false;
    }

    // ESC
    if(keycode == 27) {
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }

    // BackSpace
    if(keycode == 8) {
        if ((document.activeElement.type == "text") || 
          (document.activeElement.type == "textarea") ||
          (document.activeElement.type == "password") ||
          (document.activeElement.type == "file")) {
            if(!document.activeElement.readOnly) {
                return true;
            }
        }
        // Mozilla(Firefox, NN) and Opera
        if (e != null) {
            // The higher rank propagation of an event is prevented. 
        	e.which = 0;
            e.preventDefault();
            e.stopPropagation();
        // Internet Explorer
        } else {
            // The higher rank propagation of an event is prevented. 
        	event.keyCode = 0;
            event.returnValue = false;
            event.cancelBubble = true;
        }
        return false;
    }

    // Mozilla(Firefox, NN) and Opera
    if (e != null) {
    	// In MacOS, Cmd+R (renewal of a Web page and cash) deters.
    	if (e.metaKey && keycode == 82) {
    		return false;
    	}
    	
    	// In MacOS, it is Cmd+. Control of [(it moves to a front page) 
    	if (e.metaKey && keycode == 219) {
    		return false;
    	}
    } 
} 

function contextEventHandle() {
    return false;
}  


</script>
</head>

<body oncopy="return false" oncut="return false" onpaste="return false" onload="restrainIllegalOperation()">
<p>입력하신 학번은 <%= $idnum %> 입니다.</p>

<img src=/images/<%= $image %> width=0 height=0 border=1>

<pre>
위에 점 보이시나요?
위 점은 원래 움직이는 이미지인데 
크기가 너무 작아서 보이지 않는 것입니다.

그럼 과제입니다.

위 이미지는 원래 무슨 이미지일까요?
</pre>

</body>

</html>

@@ fail.html.ep

<html>

<head>
</head>

<body>
학번 정보를 찾을 수가 없네요..
</body>

</html>
