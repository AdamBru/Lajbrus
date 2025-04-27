<?php require_once dirname(__DIR__) . '/helper/viewSettings.php'; ?>

<script>
// Modal
let body = document.body;
let opakowanie, bg, okno, naglowek, zamknij, contener;

function modal(tytul, tresc) {
	opakowanie = document.createElement('div');
	opakowanie.classList.add('modal');
	body.style.overflow = 'hidden';

	bg = document.createElement('div');
	bg.classList.add('modal-bg');

	bg.addEventListener('click', zamknijModal);

	okno = document.createElement('div');
	okno.classList.add('modal-okno');

	naglowek = document.createElement('div');
	naglowek.classList.add('modal-head');
	naglowek.innerHTML = tytul;

	zamknij = document.createElement('div');
	zamknij.classList.add('modal-zamknij');

	zamknij.addEventListener('click', zamknijModal);

	contener = document.createElement('div');
	contener.classList.add('modal-content');
	contener.innerHTML = tresc;

	naglowek.appendChild(zamknij);
	okno.appendChild(naglowek);
	okno.appendChild(contener);
	opakowanie.appendChild(bg);
	opakowanie.appendChild(okno);
	body.appendChild(opakowanie);

	setTimeout(() => {
		opakowanie.classList.add('modal-show');
	}, 10);
}

function zamknijModal() {
	opakowanie.classList.remove('modal-show');
	setTimeout(() => {
		body.style.overflow = 'auto';
		body.removeChild(opakowanie);
		opakowanie = bg = okno = naglowek = zamknij = contener = null;
	}, 100);
}
</script>

<script>
	// settingsModal
	function settingsModal() {
	modal('Ustawienia widoku', `
		<table>
			<tr> 
				<th> 
					Rozmiar tekstu
				</th>
				<td>
					<input type="radio" name="fontSize" id="a" 					onclick="pageFontSize(16)">
						<label for="a" style="font-size: 16px">Aa</label>
					<input type="radio" name="fontSize" id="aa" 				onclick="pageFontSize(19)">
						<label for="aa" style="font-size: 19px">Aa</label>
					<input type="radio" name="fontSize" id="aaa"				onclick="pageFontSize(22)">
						<label for="aaa" style="font-size: 22px">Aa</label>
				</td>
			</tr>

			<tr>
				<th colspan="2">
					Motyw
				</th>
			</tr>
		</table>

		<div id="theme-demo-blocks">
			<input type="radio" name="theme" id="autoByDevice" 			onclick="pageTheme('autoByDdevice')">
				<label for="autoByDevice">
					<div id="autoByDevice-left">
						<div class="littleTop"></div>
						<div class="littleAside"> <i></i> <i></i> </div>
						<div class="littleMain"></div>
					</div>
					<div id="autoByDevice-right">
						<div class="littleTop"></div>
						<div class="littleMain"></div>
					</div>
						<p>Automatyczny</p>
				</label>

			<input type="radio" name="theme" id="light" 				onclick="pageTheme('light')">
				<label for="light">
					<div class="littleTop"></div>
					<div class="littleAside"> <i></i> <i></i> </div>
					<div class="littleMain"></div>
					<p>Jasny</p>
				</label>

			<input type="radio" name="theme" id="dark" 					onclick="pageTheme('dark')">
				<label for="dark">
					<div class="littleTop"></div>
					<div class="littleAside"> <i></i> <i></i> </div>
					<div class="littleMain"></div>
					<p>Ciemny</p>
				</label>

			<input type="radio" name="theme" id="highContrast" 			onclick="pageTheme('highContrast')">
				<label for="highContrast">
					<div class="littleTop"></div>
					<div class="littleAside"> <i></i> <i></i> </div>
					<div class="littleMain"></div>
					<p>Wysoki kontrast</p>
				</label>

		</div>
		`);

		// przywracanie zaznaczenia w modalu z localStorage
		switch(localStorage.getItem('fontSize')) {
			case '16':
				document.getElementById('a').checked = true;
				break;
			case '19':
				document.getElementById('aa').checked = true;
				break;
			case '22':
				document.getElementById('aaa').checked = true;
				break;
			default:
				document.getElementById('a').checked = true;
				break;
		}

		switch(localStorage.getItem('theme')) {
			case 'autoByDevice': 
				document.getElementById('autoByDevice').checked = true;
				break;
			case 'light': 
				document.getElementById('light').checked = true;
				break;
			case 'dark':
				document.getElementById('dark').checked = true;
				break;
			case 'highContrast':
				document.getElementById('highContrast').checked = true;
				break;
			default:
				document.getElementById('autoByDevice').checked = true;
				break;
		}
	}
</script>