const textarea = document.querySelector('.chat_text');
const sendBtn = document.querySelector('.sendChatBtn');
const middleDiv = document.querySelector('.middle_div');

function sendMessage() {
    const text = textarea.value.trim();
    if(text === "") return;

    // 현재 시간 가져오기
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const time = `${hours}:${minutes}`;


    // HTML 문자열로 추가
    const html = `
        <div class="chat ch2">
            <div class="textbox">${text}</div>
            <p class="chat_time">${time}</p>
        </div>
    `;
    middleDiv.insertAdjacentHTML('beforeend', html);

    // 스크롤 맨 아래
    middleDiv.scrollTop = middleDiv.scrollHeight;

    // textarea 초기화
    textarea.value = '';
}

sendBtn.addEventListener('click', sendMessage);
textarea.addEventListener('keydown', (e) => {
    if(e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        sendMessage();
    }
});
