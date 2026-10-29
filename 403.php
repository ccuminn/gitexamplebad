<?php
http_response_code(403);
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
            <span class="terminal-title">root@gitexample:~# access</span>
            <span class="terminal-buttons" aria-hidden="true">
                <i></i><i></i><i></i>
            </span>
        </div>
        <div class="terminal-body">
            <p class="prompt-line"><span class="prompt">$</span> cat /var/log/gatekeeper.log</p>
            <p class="output">PERMISSION DENIED: insufficient privileges for requested resource</p>
            <p class="error-code">403 Access Forbidden</p>
            <p class="error-message">
                You are trying to access a protected area without the required permissions.
                Verify your access rights or return to the public section of the system.
            </p>
            <div class="error-actions">
                <a class="primary-button" href="/">Back to safe node</a>
                <a class="secondary-button" href="/#contact">Request access</a>
            </div>
        </div>
    </section>
</main>

<?php include __DIR__ . '/include/footer.inc'; ?>
</body>
</html>
