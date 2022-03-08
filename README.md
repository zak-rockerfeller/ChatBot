<h3>Chatbot 1.0</h3>

In this method, we will use Dialod FLow for the AI and Flutter for the frontend. This is the expected output.

![output](https://user-images.githubusercontent.com/55271909/156922744-3eeafec8-3715-4e9c-bdaf-610ad2779816.png)


<h3>Step 1</h3>

Create an AI agent on the Dialog Flow Console by clicking on <b>Create new agent</b>. Follow this link to achieve this.https://dialogflow.cloud.google.com/

![dfss](https://user-images.githubusercontent.com/55271909/156922675-2836e7ad-bda5-4f25-9c1e-f2cf0e532ed2.png)


<h3>Step 2</h3>
Default intents have been created for you i.e Fallback and Welcome intents. These intents handle salutation and valediction responses.
Click <b>Create Intent</b> to create your preferred intents. You can also upload custom trained models.


![dfss3](https://user-images.githubusercontent.com/55271909/156923101-bffb1b42-4302-4536-a632-53fcfe05eb9b.png)


<h3>Step 3</h3>
Next step is to connect the Google Cloud Console to the Dialogflow Console. To acheive this, click on the <b>settings icon</b> next to the agent name.


![dfss3](https://user-images.githubusercontent.com/55271909/156923361-d8335e49-325a-4764-b41c-1396b136dd70.png)



On the <b>Google Project</b> column, click on the <b>Project ID</b>

![dfss4](https://user-images.githubusercontent.com/55271909/156923895-c2dbc4e4-6ca9-4578-baf3-c48fcec6b76e.png)


<h3>Step 4</h3>

Configure your <b>Google Console Platform</b> according to the following instructions https://cloud.google.com/dialogflow/es/docs/quick/setup.
Make sure to <b>enable billing</b> of the project during this process.

Ensure to download the <b>service.json</b> file and save it in the assets folder. I have named mine credentials.json. For purposes of security, I will remove this file before commit.



![flutter](https://user-images.githubusercontent.com/55271909/156923761-fdb7b009-626f-4d36-8711-4ba9a4118ff8.png)


<h3>Step </h3>
Lastly, copy and paste the Flutter UI to your project and you will be good to go.

<h4>Hope it works ;) </h4>




<h3>Chatbot 2.0</h3>

This chatbot has been created using NLP. Natural language processing (NLP) is a field that focuses on making natural human language usable by computer programs. NLTK, or Natural Language Toolkit, is a Python package that you can use for NLP.


<h4>Output</h4>


![output21](https://user-images.githubusercontent.com/55271909/157051068-005249ed-31c6-4607-814c-d47d03488f2e.png)


As you can see, Cartman and I had a really deep conversation lol. Cartman is also hilarious and has some interesting facts.




<h3>Chatbot 3.0</h3>

In this notebook, we are going to use a feed-forward neural network to train a chatbot. This is my personal favourite method of creating a chatbot because we use json files as training data. In addition, the use of Tkinter(GUI) enhances the user experience.

The use of json (JavaScript Oriented Notation) fomart, makes it possible for the chatbot to give different responses to a similar question. The previous NLP chatbot can still do this but less effectively.
<h4>JSON Input</h4>

![inputNN](https://user-images.githubusercontent.com/55271909/157267544-de0d527e-7ea7-4225-89df-b375d88615ad.png)



Natural Language Processing tools will still be used in this chatbot such as WordNetLemmatizer to analyze, clean and stucture the text data.

<h4>Output</h4>

![outputNN](https://user-images.githubusercontent.com/55271909/157267391-010fb629-bd50-4385-a7d8-b054fba07aab.png)
















