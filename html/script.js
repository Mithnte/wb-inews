window.addEventListener('message', function(event) {
    let data = event.data;
    if (data.show) {
        document.getElementById('container').style.display = 'block';
        if (data.type === 'editor') {
            document.getElementById('editor').style.display = 'block';
            document.getElementById('newspaper').style.display = 'none';
        } else if (data.type === 'newspaper') {
            document.getElementById('editor').style.display = 'none';
            document.getElementById('newspaper').style.display = 'block';
            document.getElementById('articles').innerHTML = data.articles || '<p>Belum ada berita hari ini.</p>';
        }
    } else {
        document.getElementById('container').style.display = 'none';
    }
});

function publishNews() {
    let headline = document.getElementById('headline').value;
    let body = document.getElementById('body').value;
    if (headline && body) {
        fetch(`https://${GetParentResourceName()}/publish`, {
            method: 'POST',
            body: JSON.stringify({ headline: headline, body: body })
        });
        closeUI();
    }
}

function closeUI() {
    fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' });
}
