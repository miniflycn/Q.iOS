var words = [
        'Hello Swift',
        'Hello World',
        'Hello Tencent',
        'Hello IMWeb',
        '你好世界',
        '你好腾讯',
        '你好微信',
        '你好QQ',
        123
    ];

function changeTitle() {
    return {
        prop: 'title',
        value: words[Math.random() * words.length | 0]
    };
}