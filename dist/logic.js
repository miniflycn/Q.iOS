var words = [
        'Hello Swift!',
        'Hello World!',
        'Hello IMWeb',
        '你好世界',
        '你好QQ'
    ];

function changeTitle() {
    return {
        prop: 'title',
        value: words[Math.random() * words.length | 0]
    };
}