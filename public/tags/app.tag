<app>
	<input type="text" ref="msgInput">
	<button type="button" onclick={ saveMsg }>Save Message</button>

	<script>
		console.log(rootRef);
		var tag = this;
		
		//build one more layer directly underneath the rootRef
		//step two: 
		var messagesRef = rootRef.child('/messages');

		// This example will only do so in one location.
		saveMsg(e) {
			var key = messagesRef.push().key;
			console.log(key);

			// Our data object that we will write to the database.
			// We could design this model to have other properties, like author.
			var msg = {
				//id: key,
				//our old friend ref linking directly to the dom element
				message: this.refs.msgInput.value
			};

			// Sets user message at `/messages/uniqueKey`
			//messagesRef.child(key).set(msg);
			//messagesRef.push(msg);
			messagesRef.set(msg);
		}

	</script>

	<style>
		:scope {
			display: block;
		}
	</style>
</app>
