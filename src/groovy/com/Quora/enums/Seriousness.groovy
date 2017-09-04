package com.Quora.enums

/**
 * Created by Vaibhav on 30/8/17.
 */
public enum Seriousness {

    SERIOUS('Serious'),
    VERYSERIOUS('Very Serious'),
    CASUAL('Casual')

    String id

    Seriousness(String id) {
        this.id = id
    }
}