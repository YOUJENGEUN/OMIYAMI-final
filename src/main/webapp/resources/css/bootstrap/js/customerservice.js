function openTab(contentId) {
    var content1 = document.getElementById(contentId); //첫 번째 내용이 있는 행

    var isVisible = content1.style.display === 'table-row';
    
    // 모든 내용을 숨기기
    document.querySelectorAll('.content-wrapper').forEach(content =>
        content.style.display = 'none');
    
    // 클릭한 제목의 내용 보이기/숨기기
    content1.style.display = isVisible ? 'none' : 'table-row'; //block으로 할 시 테이블 형식 X

    // 두 번째 내용을 첫 번째 내용과 동시에 보이기/숨기기
    var content2 = content1.nextElementSibling; //첫 번째 내용이 있는 행의 다음 행
    
    if (content2 && content2.classList.contains('content-wrapper')) { //두 번째 내용을 나타내는 행인지
      content2.style.display = isVisible ? 'none' : 'table-row';
    }
    
    // 모든 아이콘의 회전 상태를 초기화
    document.querySelectorAll('.rotate-img i').forEach(function(icon) {
        icon.classList.remove('rotate-down');
    });

    // 클릭한 항목의 아이콘 회전 처리
    var rotateImg = content1.previousElementSibling.querySelector('.rotate-img i');
    if (rotateImg) {
        if (isVisible) {
            rotateImg.classList.remove('rotate-down'); // 원래 상태로 돌리기
        } else {
            rotateImg.classList.add('rotate-down'); // 아이콘 회전시키기
        }
    }
}

function toggleOrderInput(select) {
  var orderInput = document.getElementById('order-input');

  // '직접 입력'일 때 input 태그 보이기, 그렇지 않으면 숨기기
  if (select.value === 'other') {
      orderInput.style.display = 'block';
      orderInput.focus();
  } else {
      orderInput.style.display = 'none';
  }
}
