document.addEventListener("DOMContentLoaded", () => {
    const cells = document.querySelectorAll(".clickable");
    const buttons = document.querySelectorAll(".menu-button");
    const tables = document.querySelectorAll(".course-table");

    // 클릭 가능한 셀에 대한 이벤트 리스너 추가
    cells.forEach(cell => {
        cell.addEventListener("click", () => {
            const prerequisite = cell.getAttribute("data-prerequisite");
            if (prerequisite) {
                const prerequisiteCell = document.querySelector(`.clickable[data-course="${prerequisite}"]`);
                if (!prerequisiteCell.classList.contains("selected")) {
                    alert(`선이수 과목 (${prerequisite})를 수강하지 않았습니다.`);
                    return;
                }
            }
            cell.classList.toggle("selected");
        });
    });

    // 메뉴 버튼 클릭 시 테이블 표시 변경
    buttons.forEach(button => {
        button.addEventListener("click", () => {
            const targetId = button.getAttribute("data-target");

            tables.forEach(table => {
                if (table.id === targetId) {
                    table.style.display = "table"; // 해당 테이블 표시
                } else {
                    table.style.display = "none"; // 나머지 테이블 숨기기
                }
            });
        });
    });
});
