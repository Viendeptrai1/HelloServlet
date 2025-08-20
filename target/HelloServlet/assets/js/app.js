/**
 * Hello Servlet - Modern UI JavaScript
 * Các hiệu ứng và tương tác cho ứng dụng
 */

// Khởi tạo khi DOM loaded
document.addEventListener('DOMContentLoaded', function() {
    initAnimations();
    initFormEnhancements();
    initCookieFeatures();
});

/**
 * Khởi tạo các animation
 */
function initAnimations() {
    // Fade in animation cho các elements
    const fadeElements = document.querySelectorAll('.fade-in-up');
    fadeElements.forEach((element, index) => {
        element.style.animationDelay = (index * 0.1) + 's';
    });

    // Hover effects cho cards
    const cards = document.querySelectorAll('.card, .demo-card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
}

/**
 * Cải thiện form experience
 */
function initFormEnhancements() {
    // Auto focus vào input đầu tiên
    const firstInput = document.querySelector('input[type="text"], input[type="password"]');
    if (firstInput) {
        firstInput.focus();
    }

    // Submit form với loading effect
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function() {
            const submitBtn = this.querySelector('button[type="submit"]');
            if (submitBtn && !submitBtn.disabled) {
                const originalText = submitBtn.innerHTML;
                submitBtn.innerHTML = 'Đang xử lý... <span class="spinner"></span>';
                submitBtn.disabled = true;
                
                // Fallback: enable lại sau 10 giây nếu không redirect
                setTimeout(() => {
                    submitBtn.innerHTML = originalText;
                    submitBtn.disabled = false;
                }, 10000);
            }
        });
    });

    // Input focus effects
    const inputs = document.querySelectorAll('input[type="text"], input[type="password"]');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';
            this.style.borderColor = '#667eea';
            this.style.boxShadow = '0 0 0 3px rgba(102, 126, 234, 0.1)';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
            this.style.borderColor = '#e2e8f0';
            this.style.boxShadow = 'none';
        });
    });
}

/**
 * Tính năng đặc biệt cho Cookie
 */
function initCookieFeatures() {
    // Remember Me checkbox enhancement
    const rememberCheckbox = document.getElementById('rememberMe');
    if (rememberCheckbox) {
        rememberCheckbox.addEventListener('change', function() {
            const label = this.nextElementSibling;
            const container = this.closest('.checkbox-group');
            
            if (this.checked) {
                label.style.color = '#667eea';
                label.style.fontWeight = '600';
                container.style.background = 'rgba(102, 126, 234, 0.1)';
                container.style.padding = '10px';
                container.style.borderRadius = '8px';
                container.style.border = '2px solid #667eea';
                
                // Hiệu ứng thông báo
                showTooltip(container, '🔄 Sẽ ghi nhớ đăng nhập trong 30 ngày!', 3000);
            } else {
                label.style.color = '';
                label.style.fontWeight = '500';
                container.style.background = '';
                container.style.padding = '';
                container.style.borderRadius = '';
                container.style.border = '';
                
                showTooltip(container, '⏰ Đăng nhập thường - 30 phút', 2000);
            }
        });
    }

    // Cookie status indicator
    if (document.querySelector('.user-info')) {
        addCookieStatusIndicator();
    }
}

/**
 * Hiển thị tooltip thông báo
 */
function showTooltip(element, message, duration = 3000) {
    const tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.textContent = message;
    tooltip.style.cssText = `
        position: absolute;
        background: #4a5568;
        color: white;
        padding: 8px 12px;
        border-radius: 6px;
        font-size: 12px;
        z-index: 1000;
        opacity: 0;
        transition: opacity 0.3s ease;
        pointer-events: none;
        top: -40px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;
    `;

    element.style.position = 'relative';
    element.appendChild(tooltip);

    // Fade in
    setTimeout(() => {
        tooltip.style.opacity = '1';
    }, 100);

    // Fade out và remove
    setTimeout(() => {
        tooltip.style.opacity = '0';
        setTimeout(() => {
            if (tooltip.parentNode) {
                tooltip.parentNode.removeChild(tooltip);
            }
        }, 300);
    }, duration);
}

/**
 * Thêm chỉ báo trạng thái cookie
 */
function addCookieStatusIndicator() {
    // Kiểm tra cookie hiện tại
    const cookies = document.cookie.split(';');
    let hasUserCookie = false;
    let hasRememberMe = false;

    cookies.forEach(cookie => {
        const [name, value] = cookie.trim().split('=');
        if (name === 'user' && value) hasUserCookie = true;
        if (name === 'rememberMe' && value === 'true') hasRememberMe = true;
    });

    if (hasUserCookie) {
        const indicator = document.createElement('div');
        indicator.className = 'cookie-indicator';
        indicator.innerHTML = hasRememberMe ? 
            '🍪 Cookie: Ghi nhớ 30 ngày' : 
            '🍪 Cookie: 30 phút';
        indicator.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: ${hasRememberMe ? '#38a169' : '#667eea'};
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            font-size: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            z-index: 1000;
            animation: slideInFromRight 0.5s ease;
        `;

        document.body.appendChild(indicator);

        // Auto hide sau 5 giây
        setTimeout(() => {
            indicator.style.animation = 'slideOutToRight 0.5s ease';
            setTimeout(() => {
                if (indicator.parentNode) {
                    indicator.parentNode.removeChild(indicator);
                }
            }, 500);
        }, 5000);
    }
}

/**
 * Utility: Format thời gian còn lại của cookie
 */
function getCookieTimeRemaining() {
    // Placeholder cho tính năng hiển thị thời gian còn lại
    // Có thể implement nếu cần
    return null;
}

/**
 * CSS Animations được thêm động
 */
function addDynamicStyles() {
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideInFromRight {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        @keyframes slideOutToRight {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(100px);
                opacity: 0;
            }
        }
        
        .tooltip {
            animation: tooltipFadeIn 0.3s ease;
        }
        
        @keyframes tooltipFadeIn {
            from {
                opacity: 0;
                transform: translateX(-50%) translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }
        }
    `;
    document.head.appendChild(style);
}

// Thêm styles khi script load
addDynamicStyles();
