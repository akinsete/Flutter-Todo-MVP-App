# Flutter-MVP Todo-List

A sample Flutter project using Clean architecture and MVP

## Clean architecture
One of the goals of the clean architecture is to encapsulate the business logic of the application / enterprise in a clean way.

## MVP Explained
The input begins with the View, not the Presenter.

There is a one-to-one mapping between the View and the associated Presenter.

The View holds a reference to the Presenter. The Presenter is also reacting to events being triggered from the View, so its aware of the View its associated with.

The Presenter updates the View based on the requested actions it performs on the Model, but the View is not Model aware.


# Screenshots
<img src="https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/sign_in.png" align="left" height="300">
<img src="https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/sign_up.png" align="left" height="300">
<img src="https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/todo_list.png" align="left" height="300">
<img src="https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/cofirm_delete.png" align="left" height="300">
<img src="https://github.com/akinsete/Flutter-Todo-MVP-App/blob/master/assets/images/create_todo.png" align="left" height="300">
