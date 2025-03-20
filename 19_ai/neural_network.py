import numpy as np
from random import random

w1 = np.array([
    [random() * 4 - 2 for _ in range(4)] for _ in range(5)
])
w2 = np.array([
    [random() * 4 - 2 for _ in range(5)] for _ in range(1)
])
bias = np.array([0, 0, 0, 0, 0])


def sigmoid(x):
    return 1 / (1 + np.exp(-x))


def make_prediction(i):
    l1 = np.dot(w1, i) + bias
    l2 = np.dot(w2, l1)
    l3 = sigmoid(l2)

    return sigmoid(l3)


i = np.array([random() * 4 - 2 for _ in range(4)])
prediction = make_prediction(i)
target = 0

error = np.square(prediction - target)
print(prediction, error)

learning_rate = 0.01

for _ in range(100):
    l1 = np.dot(w1, i) + bias
    l2 = np.dot(w2, l1)
    l3 = sigmoid(l2)

    derror = 2 * (prediction - error)
    dlayer3 = sigmoid(l2) * (1 - sigmoid(l2))
    dlayer2 = np.sum(l1)
    dlayer1 = np.array([np.sum(i) for _ in range(4)])
    dbias = np.array([1 for _ in range(5)])

    derror_dweights = derror * dlayer3 * dlayer2 * dlayer1
    derror_dweights2 = derror * dlayer3 * dlayer2
    derror_dbias = derror * dlayer3 * dlayer2 * dbias

    bias = bias - (derror_dbias * learning_rate)
    w2 = w2 - (derror_dweights2 * learning_rate)
    w1 = w1 - (derror_dweights * learning_rate)

    prediction = make_prediction(i)

    error = np.square(prediction - target)
    print(prediction, error)
