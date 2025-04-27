<script>
// pageFontSize
function pageFontSize(size) {
	try {
		localStorage.setItem('fontSize', size);
		loadFontSize();
	} catch (e) {
		console.error("Nie udało się zapisać ustawień w localStorage:", e);
	}
}

function loadFontSize() {
	fontSize = localStorage.getItem('fontSize');
	fontSize = fontSize || '16';
	root = document.querySelector(":root");
	root.style.fontSize = fontSize + "px";
}

// pageTheme
function pageTheme(theme) {
	try {
		localStorage.setItem('theme', theme);
		loadTheme();
	} catch (e) {
		console.error("Nie udało się zapisać ustawień w localStorage:", e);
	}
}

function loadTheme() {
	theme = localStorage.getItem('theme');
	root = document.querySelector(":root");

	switch(theme) {
		case 'light':
			function lightTheme() {
				root.style.setProperty('--color-main', '#36c');
				root.style.setProperty('--color-bg', '#f9f9f9');
				root.style.setProperty('--color-text', '#000');
				root.style.setProperty('--color-text-contrast', '#fff');
				root.style.setProperty('--color-aside', '#eee');
				root.style.setProperty('--color-table-a', '#eee');
				root.style.setProperty('--color-table-b', '#dfdfdf');
				document.getElementById('settingsButton').style.filter = 'invert(0)';
				document.querySelectorAll('*').forEach(el => {el.classList.remove('highContrast');});
			}
			lightTheme();
			break;

		case 'dark':
			function darkTheme() {
				root.style.setProperty('--color-main', '#284baa');
				root.style.setProperty('--color-bg', '#333');
				root.style.setProperty('--color-text', '#eaeaea');
				root.style.setProperty('--color-text-contrast', '#eaeaea');
				root.style.setProperty('--color-aside', '#252525');
				root.style.setProperty('--color-table-a', '#252525');
				root.style.setProperty('--color-table-b', '#1e1e1e');
				document.getElementById('settingsButton').style.filter = 'invert(.9)';
				document.querySelectorAll('*').forEach(el => {el.classList.remove('highContrast');});
			}
			darkTheme();
			break;

		case 'autoByDevice':
			function autoByDevice() {
				if(window.matchMedia('(prefers-color-scheme: dark)').matches ) {
					darkTheme();
				} else {
					lightTheme();
				}
			}
			autoByDevice();
			break;

		case 'highContrast':
			function highContrastTheme() {
				root.style.setProperty('--color-main', 'ff0');
				root.style.setProperty('--color-bg', '#000');
				root.style.setProperty('--color-text', '#ff0');
				root.style.setProperty('--color-text-contrast', '#ff0');
				root.style.setProperty('--color-aside', '#000');
				root.style.setProperty('--color-table-a', '#000');
				root.style.setProperty('--color-table-b', '#000');
				document.querySelectorAll('*').forEach(el => {el.classList.add('highContrast');});
			}
			highContrastTheme();
			break;
			
		default: 
			autoByDevice();
			break;
	}
}
</script>

<script>
	// ładowanie ustawień 
	loadFontSize();
	loadTheme();
</script>