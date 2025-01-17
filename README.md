# flutter_chat_test_app

### A new Flutter project.

### This project is a simple chat.

# Feature Included

- ### registration by endpoint
- ### handle socket connection
- ### handle internet connection for reconnecting socket
- ### simple UI for better experience

# Architecture

- ### Clean Architecture approach
- ### Layer-fist approach
- ### Repository pattern
- ### Dependency Injection

# Used Technologies

- ### Get_It (Service locator/DI)
- ### Bloc (State management)
- ### Auto_Router (Navigation)
- ### Retrofit (Networking)
- ### Dio (Networking)
- ### SharedPreferences (Local store)
- ### Connectivity (Handle Connection)

# Get Started

### First of all you need to

### clone [repo with Node js code](https://github.com/Andestrial123/Socket-Server-Template)

### You will need to install node if you haven't it yet

## MacOS

```bash
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v # Should print "v22.13.0".
nvm current # Should print "v22.13.0".
# Verify npm version:
npm -v # Should print "10.9.2".
```

## Windows

```bash
# Download and install fnm:
winget install Schniz.fnm
# Download and install Node.js:
fnm install 22
# Verify the Node.js version:
node -v # Should print "v22.13.0".
# Verify npm version:
npm -v # Should print "10.9.2".
```
### If you have some problems with install try to manually install node from [site](https://github.com/Andestrial123/Socket-Server-Template)
### Than open repo with server side code and get all packages by running command

```bash
npm install
```

### After getting all packages start the server side for make socket connection for app

```bash
npm start 
```
or

```bash
node main.js
```

### Then you can clone this repo.

### Open in IDE and get all dependency for project by command:

```bash
flutter pub get
```

### Run few devices, run project and start chatting and testing !

# Additional Information

### For now this app only imitation of chat app for a few reason

- ### Have no history of chat
- ### Have no different chat rooms
- ### Have no store of chat message

### For being a fully done there need to write a whole backend for identify users , store their message , session , additional data, etc.

## Enjoy testing !
