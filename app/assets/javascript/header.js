document.addEventListener('DOMContentLoaded', () => {
    // Мобильное меню
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    const header = document.querySelector('.site-header');

    if (menuToggle) {
        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    }

    // Изменение хедера при прокрутке
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Выпадающее меню пользователя
    const userDropdown = document.querySelector('.dropdown');
    const userDropdownToggle = document.querySelector('.dropdown-toggle');
    const userDropdownContent = document.querySelector('.dropdown-content');

    if (userDropdown && userDropdownToggle && userDropdownContent) {
        userDropdownToggle.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            userDropdownContent.classList.toggle('show');
        });

        // Закрытие выпадающего меню при клике вне его
        document.addEventListener('click', (e) => {
            if (!userDropdown.contains(e.target)) {
                userDropdownContent.classList.remove('show');
            }
        });
    } else {
        console.log('Элементы выпадающего меню не найдены:', {
            userDropdown,
            userDropdownToggle,
            userDropdownContent
        });
    }
});
