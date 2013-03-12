<!-- 
	This is the static page to handle F1 Account not found (401)
 -->
<div style="width:610px;"> 
 
<div id="installBAWrapper" style="width:550px;">
	<div style="margin:0px 0px 20px 20px;">
		<h2 style="padding-bottom:10px">Add Media to Backup Assistant Plus</h2>
		<span class="whyBox">
			<span>There are many ways to upload and store your media with Backup Assistant Plus. You can upload media directly from your computer, back it up from your phone, or use our desktop application. Keep your Music, Pictures, Videos and Documents safe by uploading them to your BUA+ account.</span>
		</span>		
	</div>
</div>

	
	<div style="margin-left:40px;" >
			
			<span class="downloadContent">
				<a onclick="openContent(1);"><div style="cursor:pointer; color:blue;"><u id="node1" >+</u><u> Upload media directly to Backup Assistant Plus</u></div></a>
					<div style="margin-left:20px; width:570px;"><span id="pg1"></span></div>
				<br>
				<a onclick="openContent(2);"><div style="cursor:pointer; color:blue;"><u id="node2" >+</u><u> Back up media from your phone</u></div></a>
					<div style="margin-left:20px; width:570px;"><span id="pg2"></span></div>
				<br>
				<a onclick="openContent(3);"><div style="cursor:pointer; color:blue;"><u id="node3" >+</u><u> Download our free V CAST Media Manager Desktop Application.</u></div></a>
					<div style="margin-left:20px; width:570px;"><span id="pg3"></span>
						<div id="box" style="float:right; border-style:solid; border-width:0px; color:blue; cursor:pointer; padding-top:4px; padding-bottom:4px;"></div>
					</div>
				<br>
			</span>

	<script type="text/javascript">
	
	function openContent(num){
			if(num == 1){
				if(document.getElementById("node1").innerHTML == "+"){
					document.getElementById("node1").innerHTML = "-";
					document.getElementById("pg1").innerHTML = "<br>Use the link to your right to upload made directly from your computer.<br>";
				}else{
					document.getElementById("node1").innerHTML = "+";
					document.getElementById("pg1").innerHTML = "";
				}
			}else if(num == 2){
				if(document.getElementById("node2").innerHTML == "+"){
					document.getElementById("node2").innerHTML = "-";
					document.getElementById("pg2").innerHTML = "<br>1.&nbsp;&nbsp;&nbsp;Open your phone's application menu and click on the V CAST Media Manager Icon. You &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may be prompted to sign in using your My Verizon username and password.<br>2.&nbsp;&nbsp;&nbsp;After signing in, click on Settings > Configure Backup to set your media backup schedule.<br>";
				}else{
					document.getElementById("node2").innerHTML = "+";
					document.getElementById("pg2").innerHTML = "";
				}
			}else if(num == 3){
				if(document.getElementById("node3").innerHTML == "+"){
					document.getElementById("node3").innerHTML = "-";
					document.getElementById("pg3").innerHTML = "<br>1.&nbsp;&nbsp;&nbsp;Save the pictures and videos created with your phone onto your computer.<br>2.&nbsp;&nbsp;&nbsp;Create picture albums, slideshows, and video playlists.<br>3.&nbsp;&nbsp;&nbsp;Transfer songs from your computer to your phone.<br>4.&nbsp;&nbsp;&nbsp;Back up, access and restore your media files anytime, from anywhere.<br><div style:><br>";
					document.getElementById("box").style.borderWidth = "1px";
					document.getElementById("box").innerHTML = "&nbsp;Download Desktop Application&nbsp;";
				}else{
					document.getElementById("node3").innerHTML = "+";
					document.getElementById("pg3").innerHTML = "";
					document.getElementById("box").innerHTML = "";
					document.getElementById("box").style.borderWidth = "0px";
				}
			}
		
	}
		
		
	</script>
	</div>
</div>