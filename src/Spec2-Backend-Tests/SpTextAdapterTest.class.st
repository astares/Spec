Class {
	#name : #SpTextAdapterTest,
	#superclass : #SpAbstractTextAdapterTest,
	#category : #'Spec2-Backend-Tests-Base'
}

{ #category : #accessing }
SpTextAdapterTest >> classToTest [

	^ SpTextPresenter
]

{ #category : #accessing }
SpTextAdapterTest >> testKeyBindings [
	| handled |

	handled := false.
	presenter 
		bindKeyCombination: $x meta 
		toAction: [ handled := true ].

	self adapter 
		keyDown: $x 
		shift: false 
		meta: true
		control: false
		option: false. 

	self assert: handled
]

{ #category : #tests }
SpTextAdapterTest >> testLineAtCursorPosition [

	self openInstance.
	presenter text: 'one
two
three'.
	
	presenter cursorPositionIndex: 5.
	self assert: presenter lineAtCursorPosition equals: 'two'.
	
	presenter cursorPositionIndex: 8.
	self assert: presenter lineAtCursorPosition equals: 'two'.	
	
	presenter cursorPositionIndex: 14.
	self assert: presenter lineAtCursorPosition equals: 'three'.
	
	presenter text: ''.
	presenter cursorPositionIndex: 1.
	self assert: presenter lineAtCursorPosition equals: ''.
	
	
]

{ #category : #accessing }
SpTextAdapterTest >> testRightClickShowsMenu [
	| menu |

	presenter contextMenu: (menu := SpMockMenuPresenter new).

	self deny: menu shown.
	self emulateRightClick.
	self assert: menu shown
]

{ #category : #tests }
SpTextAdapterTest >> testTextIsAlwaysString [

	presenter text: 'one'.
	self openInstance.
	
	self assert: (presenter text isKindOf: String)

]
