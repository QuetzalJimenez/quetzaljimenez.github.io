function adjustSocialEmbeds() {

    const instagramEmbed = document.querySelector('.social-item.instagram-embed-container');
    const instagramItem = instagramEmbed?.closest('.social-item');
    const logoHeightInstagram = instagramItem?.querySelector('.social-logo')?.offsetHeight || 0;
    const infoHeightInstagram = instagramItem?.querySelector('.social-info')?.offsetHeight || 0;
    const spacingInstagram = 25;
    const desiredTopMarginInstagram = logoHeightInstagram + infoHeightInstagram + 25 + spacingInstagram;

    if (instagramEmbed) {
        instagramEmbed.style.position = 'absolute';
        instagramEmbed.style.top = `${desiredTopMarginInstagram}px`;
        instagramEmbed.style.left = '0';
        instagramEmbed.style.width = '100%';
    }

    const twitterEmbed = document.querySelector('.social-item.twitter-embed-container');
    const twitterItem = twitterEmbed?.closest('.social-item');
    const logoHeightTwitter = twitterItem?.querySelector('.social-logo')?.offsetHeight || 0;
    const infoHeightTwitter = twitterItem?.querySelector('.social-info')?.offsetHeight || 0;
    const spacingTwitter = 25; 
    const desiredTopMarginTwitter = logoHeightTwitter + infoHeightTwitter + 20 + spacingTwitter;

    if (twitterEmbed) {
        twitterEmbed.style.position = 'absolute';
        twitterEmbed.style.top = `${desiredTopMarginTwitter}px`;
        twitterEmbed.style.left = '0';
        twitterEmbed.style.width = '100%';
    }
}

window.onload = function() {
    adjustSocialEmbeds();
    setTimeout(adjustSocialEmbeds, 1500);
};

