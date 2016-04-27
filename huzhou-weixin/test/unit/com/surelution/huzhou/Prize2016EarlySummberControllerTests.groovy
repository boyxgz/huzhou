package com.surelution.huzhou



import org.junit.*
import grails.test.mixin.*

@TestFor(Prize2016EarlySummberController)
@Mock(Prize2016EarlySummber)
class Prize2016EarlySummberControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prize2016EarlySummber/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prize2016EarlySummberInstanceList.size() == 0
        assert model.prize2016EarlySummberInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.prize2016EarlySummberInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prize2016EarlySummberInstance != null
        assert view == '/prize2016EarlySummber/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prize2016EarlySummber/show/1'
        assert controller.flash.message != null
        assert Prize2016EarlySummber.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prize2016EarlySummber/list'

        populateValidParams(params)
        def prize2016EarlySummber = new Prize2016EarlySummber(params)

        assert prize2016EarlySummber.save() != null

        params.id = prize2016EarlySummber.id

        def model = controller.show()

        assert model.prize2016EarlySummberInstance == prize2016EarlySummber
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prize2016EarlySummber/list'

        populateValidParams(params)
        def prize2016EarlySummber = new Prize2016EarlySummber(params)

        assert prize2016EarlySummber.save() != null

        params.id = prize2016EarlySummber.id

        def model = controller.edit()

        assert model.prize2016EarlySummberInstance == prize2016EarlySummber
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prize2016EarlySummber/list'

        response.reset()

        populateValidParams(params)
        def prize2016EarlySummber = new Prize2016EarlySummber(params)

        assert prize2016EarlySummber.save() != null

        // test invalid parameters in update
        params.id = prize2016EarlySummber.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prize2016EarlySummber/edit"
        assert model.prize2016EarlySummberInstance != null

        prize2016EarlySummber.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prize2016EarlySummber/show/$prize2016EarlySummber.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prize2016EarlySummber.clearErrors()

        populateValidParams(params)
        params.id = prize2016EarlySummber.id
        params.version = -1
        controller.update()

        assert view == "/prize2016EarlySummber/edit"
        assert model.prize2016EarlySummberInstance != null
        assert model.prize2016EarlySummberInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prize2016EarlySummber/list'

        response.reset()

        populateValidParams(params)
        def prize2016EarlySummber = new Prize2016EarlySummber(params)

        assert prize2016EarlySummber.save() != null
        assert Prize2016EarlySummber.count() == 1

        params.id = prize2016EarlySummber.id

        controller.delete()

        assert Prize2016EarlySummber.count() == 0
        assert Prize2016EarlySummber.get(prize2016EarlySummber.id) == null
        assert response.redirectedUrl == '/prize2016EarlySummber/list'
    }
}
