# Note: you need to be using OpenAI Python v0.27.0 for the code below to work
from openai import OpenAI
import os
import click


OPENAI_API_KEY = os.environ.get("OPENAI_API_KEY")
assert OPENAI_API_KEY, ("OPENAI_API_KEY env variable not set")
client = OpenAI(api_key=OPENAI_API_KEY)
models = ["gpt-3.5-turbo", "gpt-4", "gpt-4-32k", "gpt-4-1106-preview"]

class Context:
    def __init__(self, role, content):
        self.role = role
        self.content = content
    
    def to_dict(self):
        return {'role': self.role, 'content': self.content} # type: ignore

def ai_answer(prompt, format, style, model):
    CONTEXT = []
    msgs = [
         {"role": "system", "content": f"Format the answers {format}"},
         {"role": "system", "content": f"You are {style}"},
    ]
    CONTEXT.append(Context(role="user", content=prompt).to_dict())
    msgs.extend(CONTEXT)
    response = client.chat.completions.create(model=model,messages=msgs)
    response_txt = response.choices[0].message.content
    CONTEXT.append(Context(role="assistant", content=response_txt).to_dict())
    return response_txt

@click.command(help="Use OpenAI API via your OPENAI_API_KEY to get the AI to answer the prompts and ask the user for the next prompt.\n \
                     When the user types \"exit\" the chat should exit.\n")
@click.option('--prompt', default='', help='Enter a smart prompt')
@click.option('--format', default='', help='Enter the format that the answers should follow')
@click.option('--style', default='Jim Carrey in Ace Ventura', help='Describe the character/role of the AI that the answers will reflect, default is answering in character of Ace Ventura The Pet Detective')
@click.option('--model', default="gpt-3.5-turbo", help=f'Choose an LLM: {models}')
def chat(prompt, format, style, model):
    # use OpenAI API to get the answer to the prompts print the answer and ask the user for the next prompt
    # when the user types "exit" the chat should exit
    if model not in models:
        print(f"Wrong OpenAI LLM model. Choose from: {models}")
        exit(1)
    if not prompt:
        prompt = input("Enter your prompt: ")
    while prompt != "exit":
        print(ai_answer(prompt, format, style, model))
        prompt = input("Enter your prompt: ")

if __name__ == "__main__":
    chat()