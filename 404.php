<?php
http_response_code(404);
require_once __DIR__ . '/config.inc';
$menuItems = [
    ['Home', ''],
    ['Research', '/#research'],
    ['Labs', '/#labs'],
    ['Archive', '/#archive'],
    ['Contact', '/#contact']
];
include __DIR__ . '/include/header.inc';
include __DIR__ . '/include/menu.inc';
?>

<main class="page-content error-page">
    <section class="terminal-window error-window">
        <div class="terminal-header">
            <span class="terminal-title">root@gitexample:~# locate</span>
            <span class="terminal-buttons" aria-hidden="true">
                <i></i><i></i><i></i>
            </span>
        </div>
        <div class="terminal-body">
            <p class="prompt-line"><span class="prompt">$</span> find / -name requested-page</p>
            <p class="output">No match found in current index. Target moved, renamed, or never existed.</p>
            <p class="error-code">404 Page not found</p>
            <p class="error-message">
                The requested page is not available. Try returning to the homepage
                or open contact if you need the correct link.
            </p>
            <div class="error-actions">
                <a class="primary-button" href="/">Back to command center</a>
                <a class="secondary-button" href="/#contact">Report dead link</a>
            </div>
        </div>
    </section>
</main>

<?php include __DIR__ . '/include/footer.inc'; ?>
</body>
</html>
