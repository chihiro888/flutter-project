from openai import OpenAI
from firebase_functions import https_fn
from firebase_admin import initialize_app

initialize_app()

def gpt():
    openai_api_key = ""
    client = OpenAI(api_key=openai_api_key)

    completion = client.chat.completions.create(
        messages=[
            {
                "role": "user",
                "content": "영어 문제를 만들어줘.",
            },
            {
                "role": "user",
                "content": "해당 영어 문제는 영어 문법, 어휘 지식과 독해능력을 다각도로 평가하는 영역이에요.",
            },
            {
                "role": "user",
                "content": "문장이 주어진 상태에서 어떤 부분이 비어 있는 경우, 그 빈 칸에 알맞은 단어를 채우는 문제 유형입니다.",
            },
            {
                "role": "user",
                "content": "응답을 JSON으로 반환해주세요.",
            },
            {
                "role": "user",
                "content": "해당 문제의 정답에 대한 해설을 같이 한국어로 설명해줍니다.",
            },
            {
                "role": "user",
                "content": "해당 문제의 해석을 한국어로 알려줍니다.",
            },
            {
                "role": "user",
                "content": "문제의 키는 question 정답의 키는 answer 선택은 choices 리스트로 해설은 desc로 해석은 means으로 반환합니다.",
            },
            {
                "role": "user",
                "content": "응답은 무조건 JSON으로 반환합니다.",
            },
            {
                "role": "user",
                "content": ''' 
                    예시는 아래의 포맷을 참고하십시오.
                    절대 다른 포맷으로 출력하지 마십시오.
                    {
                        "question": "I ____ to the park with my friends yesterday.",
                        "choices": ["went", "go", "goes", "going"],
                        "answer": "went",
                        "desc": "went은 '가다'의 과거형이며, 주어인 'I'와 일치합니다.",
                        "means": "나는 어제 친구들과 함께 공원에 갔다."
                    }
                ''',
            },
            {
                "role": "user",
                "content": 'JSON의외에 불필요한 대사를 대답하지 마십시오. 무조건 JSON 이외에는 대답하지 않습니다.'
            },
            {
                "role": "user",
                "content": '문제의 난이도를 토익 수준의 난이도로 만들어주세요.'
            },
            {
                "role": "user",
                "content": '문제의 주제나 유형은 랜덤으로 선정해주세요.'
            },
        ],
        model="gpt-3.5-turbo",
    )
    return completion.choices[0].message.content

@https_fn.on_request()
def create_toeic_problem(req: https_fn.Request) -> https_fn.Response:
    if req.method == "GET":
        try:
            return https_fn.Response(gpt())
        except Exception as e:
            return https_fn.Response(f"Error generating response: {str(e)}", status_code=500)
    else:
        return https_fn.Response("Method not allowed", status_code=405)