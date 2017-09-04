package com.Quora.enums
/**
 * Created by bhaskar on 30/8/17.
 */
public enum Visibility {
    PUBLIC('public'),
    PRIVATE('private')

    String id;

    Visibility(String id) {
        this.id = id
    }
}