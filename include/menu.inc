<nav class="topbar" aria-label="Hlavní navigace">
    <div class="brand" aria-label="gitexample">
        <span class="brand-mark">&lt;/&gt;</span>
        <span>GITexample</span>
    </div>
    <div class="nav-links">
        <?php foreach ($menuItems as $item): ?>
            <a href="<?php echo $item[1]; ?>"><?php echo htmlspecialchars($item[0], ENT_QUOTES, 'UTF-8'); ?></a>
        <?php endforeach; ?>
    </div>
    <a class="cta-button" href="#contact">Initialize Session</a>
</nav>
