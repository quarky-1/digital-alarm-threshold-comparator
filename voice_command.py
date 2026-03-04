import speech_recognition as sr

def listen_command(timeout=30):
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print(f"Listening for up to {timeout} seconds...")
        audio = r.listen(source, timeout=timeout)
    try:
        cmd = r.recognize_google(audio)
        print(f"Recognized: {cmd}")
        return cmd
    except:
        return "unrecognized"
